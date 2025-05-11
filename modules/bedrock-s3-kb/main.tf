###################
#  IAM-Resources  #
###################

############# Bedrock KB Execution Role #############
resource "aws_iam_role" "kb_service_role" {
  count              = var.is_kb ? 1 : 0
  name               = var.iam_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy[0].json
}

############# Bedrock KB Execution Service Role Policy #############
resource "aws_iam_role_policy" "kb_service_role_policy" {
  count  = var.is_kb ? 1 : 0
  name   = var.iam_service_role_policy_name
  role   = aws_iam_role.kb_service_role[0].name
  policy = data.aws_iam_policy_document.service_role_policy[0].json
}

############# Bedrock KB Role policy To S3 Policy #############
resource "aws_iam_role_policy" "kb_service_role_policy_to_s3" {
  count  = var.is_kb ? 1 : 0
  name   = var.iam_policy_to_s3_name
  role   = aws_iam_role.kb_service_role[0].name
  policy = data.aws_iam_policy_document.policy_to_s3[0].json
}

############# KB Service Role policy OSS Access Policy #############
resource "aws_iam_role_policy" "kb_service_role_policy_to_oss" {
  count  = var.is_kb ? 1 : 0
  name   = var.iam_policy_to_oss_name
  role   = aws_iam_role.kb_service_role[0].name
  policy = data.aws_iam_policy_document.policy_to_oss[0].json
}

###################
#  OSS-Resources  #
###################


############# OSS Access Policy #############
resource "aws_opensearchserverless_access_policy" "data_policy" {
  count = var.is_kb ? 1 : 0
  name  = var.oss_access_policy_name
  type  = "data"
  policy = jsonencode([
    {
      Rules = [
        {
          ResourceType = "index"
          Resource = [
            "index/${var.oss_collection_name}/*"
          ]
          Permission = [
            "aoss:CreateIndex",
            "aoss:DeleteIndex",
            "aoss:DescribeIndex",
            "aoss:ReadDocument",
            "aoss:UpdateIndex",
            "aoss:WriteDocument"
          ]
        },
        {
          ResourceType = "collection"
          Resource = [
            "collection/${var.oss_collection_name}"
          ]
          Permission = [
            "aoss:CreateCollectionItems",
            "aoss:DescribeCollectionItems",
            "aoss:UpdateCollectionItems"
          ]
        }
      ],
      Principal = [
        aws_iam_role.kb_service_role[0].arn,
        data.aws_caller_identity.current.arn
      ]
    }
  ])
}

############# OSS Encryption Policy #############
resource "aws_opensearchserverless_security_policy" "security_policy" {
  for_each = var.is_kb ? tomap(local.oss_security_policies) : {}

  type   = each.key
  name   = each.value.name
  policy = each.value.policy
}

############# OSS Collection Creation #############
resource "aws_opensearchserverless_collection" "collection" {
  count            = var.is_kb ? 1 : 0
  name             = var.oss_collection_name
  type             = "VECTORSEARCH"
  standby_replicas = var.standby_replicas
  depends_on = [
    aws_opensearchserverless_access_policy.data_policy,
    aws_opensearchserverless_security_policy.security_policy,
  ]
}

############# OSS Collection Index Creation #############
resource "opensearch_index" "index" {
  count                          = var.is_kb ? 1 : 0
  name                           = var.oss_index_name
  number_of_shards               = var.number_of_shards
  number_of_replicas             = var.number_of_replicas
  index_knn                      = true
  index_knn_algo_param_ef_search = var.index_knn_algo_param_ef_search
  mappings                       = <<-EOF
    {
      "properties": {
        "${var.knowledge_base_vector_name}": {
          "type": "knn_vector",
          "dimension": 1024,
          "method": {
            "name": "hnsw",
            "engine": "faiss",
            "parameters": {
              "m": 16,
              "ef_construction": 512
            },
            "space_type": "l2"
          }
        },
        "AMAZON_BEDROCK_METADATA": {
          "type": "text",
          "index": "false"
        },
        "AMAZON_BEDROCK_TEXT_CHUNK": {
          "type": "text",
          "index": "true"
        }
      }
    }
  EOF
  force_destroy                  = true
  depends_on                     = [aws_opensearchserverless_collection.collection]
}

##################
#  KB-Resources  #
##################

############# Knowledge Base Creation #############
resource "aws_bedrockagent_knowledge_base" "kb" {
  count    = var.is_kb ? 1 : 0
  name     = var.kb_name
  role_arn = aws_iam_role.kb_service_role[0].arn
  knowledge_base_configuration {
    vector_knowledge_base_configuration {
      embedding_model_arn = data.aws_bedrock_foundation_model.kb.model_arn
    }
    type = "VECTOR"
  }
  storage_configuration {
    type = "OPENSEARCH_SERVERLESS"
    opensearch_serverless_configuration {
      collection_arn    = aws_opensearchserverless_collection.collection[0].arn
      vector_index_name = var.oss_index_name
      field_mapping {
        vector_field   = var.knowledge_base_vector_name
        text_field     = "AMAZON_BEDROCK_TEXT_CHUNK"
        metadata_field = "AMAZON_BEDROCK_METADATA"
      }
    }
  }
  depends_on = [
    aws_iam_role_policy.kb_service_role_policy,
    aws_iam_role_policy.kb_service_role_policy_to_s3,
    opensearch_index.index,
    time_sleep.policy_attach_sleep
  ]
}

############# KB Data Source Creation #############
resource "aws_bedrockagent_data_source" "ds" {
  count             = var.is_kb ? 1 : 0
  knowledge_base_id = aws_bedrockagent_knowledge_base.kb[0].id
  name              = var.kb_ds_name
  data_source_configuration {
    type = "S3"
    s3_configuration {
      bucket_arn = var.bucket_arn
    }
  }

  vector_ingestion_configuration {
    chunking_configuration {
      chunking_strategy = "FIXED_SIZE"
      fixed_size_chunking_configuration {
        max_tokens         = 512
        overlap_percentage = 20
      }
    }
  }
}
