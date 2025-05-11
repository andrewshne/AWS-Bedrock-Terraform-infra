######################
#  Bedrock-kb-creation  #
######################
module "bedrock" {
  source = "./modules/bedrock-s3-kb"

  is_kb                        = var.is_kb
  bucket_arn                   = module.ds_bucket.s3_bucket_arn
  kb_model_id                  = "amazon.titan-embed-text-v2:0"
  iam_role_name                = "${local.prefix_name}_AmazonBedrockExecutionRoleForKnowledgeBase_kb"
  iam_service_role_policy_name = "${local.prefix_name}_AmazonBedrockFoundationModelPolicyForKnowledgeBase_kb"
  iam_policy_to_s3_name        = "${local.prefix_name}_AmazonBedrockS3PolicyForKnowledgeBase_kb"
  iam_policy_to_oss_name       = "${local.prefix_name}_AmazonBedrockOSSPolicyForKnowledgeBase_kb"
  oss_access_policy_name       = "${local.prefix_name}-access-policy"
  oss_encryption_policy_name   = "${local.prefix_name}-encryption-policy"
  oss_network_policy_name      = "${local.prefix_name}-network-policy"
  oss_collection_name          = "${local.prefix_name}-collection"
  oss_index_name               = "${local.prefix_name}-kb-oss-index"
  knowledge_base_vector_name   = "${local.prefix_name}-kb-vector"
  kb_name                      = "${local.prefix_name}-kb"
  kb_ds_name                   = "${local.prefix_name}-kb-ds"
}