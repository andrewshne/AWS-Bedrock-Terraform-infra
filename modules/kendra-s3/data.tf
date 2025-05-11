########
# Data #
########

data "aws_caller_identity" "current" {}
data "aws_partition" "this" {}
data "aws_region" "this" {}

###################
#  Data-policies  #
###################

data "aws_iam_policy_document" "role_trust" {
  count = var.is_kendra ? 1 : 0
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["kendra.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "service_role_policy" {
  count = var.is_kendra ? 1 : 0
  statement {
    effect    = "Allow"
    actions   = ["cloudwatch:PutMetricData"]
    resources = ["*"]

    condition {
      test     = "ForAnyValue:StringEquals"
      variable = "cloudwatch:namespace"
      values   = ["AWS/Kendra"]
    }
  }
  statement {
    effect    = "Allow"
    actions   = ["logs:DescribeLogGroups"]
    resources = ["*"]
  }
  statement {
    effect    = "Allow"
    actions   = ["kendra:BatchDeleteDocument"]
    resources = [try("${awscc_kendra_index.kendra_index[0].arn}", 0)]
  }
  statement {
    effect    = "Allow"
    actions   = ["logs:CreateLogGroup"]
    resources = ["arn:aws:logs:${local.region}:${data.aws_caller_identity.current.account_id}:log-group:/aws/kendra/*"]
  }
  statement {
    effect = "Allow"
    actions = [
      "logs:DescribeLogStreams",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = ["arn:aws:logs:${local.region}:${data.aws_caller_identity.current.account_id}:log-group:/aws/kendra/*:log-stream:*"]
  }
  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:ListBucket"
    ]
    resources = [
      var.bucket_arn,
      "${var.bucket_arn}/*"
    ]
  }
}
