##########
#  Data  #
##########

data "aws_caller_identity" "current" {}
data "aws_partition" "this" {}
data "aws_region" "this" {}

data "aws_bedrock_foundation_model" "kb" {
  model_id = var.kb_model_id
}

###################
#  Data-policies  #
###################

data "aws_iam_policy_document" "assume_role_policy" {
  count = var.is_kb ? 1 : 0
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["bedrock.amazonaws.com"]
    }
    condition {
      test     = "ForAnyValue:StringEquals"
      variable = "aws:SourceAccount"
      values   = [local.account_id]
    }

    condition {
      test     = "ForAnyValue:ArnLike"
      variable = "aws:SourceArn"
      values   = ["arn:${local.partition}:bedrock:${local.region}:${local.account_id}:knowledge-base/*"]
    }
  }
}

data "aws_iam_policy_document" "service_role_policy" {
  count = var.is_kb ? 1 : 0
  statement {
    effect    = "Allow"
    actions   = ["bedrock:InvokeModel"]
    resources = [data.aws_bedrock_foundation_model.kb.model_arn]
  }
}

data "aws_iam_policy_document" "policy_to_s3" {
  count = var.is_kb ? 1 : 0
  statement {
    sid       = "S3ListBucketStatement"
    actions   = ["s3:ListBucket"]
    effect    = "Allow"
    resources = [var.bucket_arn]

    condition {
      test     = "ForAnyValue:StringEquals"
      variable = "aws:PrincipalAccount"
      values   = [local.account_id]
    }
  }
  statement {
    sid       = "S3GetObjectStatement"
    actions   = ["s3:GetObject"]
    effect    = "Allow"
    resources = ["${var.bucket_arn}/*"]

    condition {
      test     = "ForAnyValue:StringEquals"
      variable = "aws:PrincipalAccount"
      values   = [local.account_id]
    }
  }
}

data "aws_iam_policy_document" "policy_to_oss" {
  count = var.is_kb ? 1 : 0
  statement {
    actions   = ["aoss:APIAccessAll"]
    effect    = "Allow"
    resources = [try(aws_opensearchserverless_collection.collection[0].arn, 0)]
  }
}
