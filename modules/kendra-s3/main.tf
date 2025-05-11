

###################
#  IAM-Resources  #
###################

############# Kendra service role creation #############
resource "awscc_iam_role" "kendra_iam_role" {
  count                       = var.is_kendra ? 1 : 0
  role_name                   = var.role_name
  assume_role_policy_document = data.aws_iam_policy_document.role_trust[0].json
  max_session_duration        = 7200
  tags                        = local.terraform_tag
}

############# Kendra service policy creation #############
resource "awscc_iam_role_policy" "kendra_iam_role_policy" {
  count       = var.is_kendra ? 1 : 0
  policy_name = var.role_policy_name
  role_name   = awscc_iam_role.kendra_iam_role[0].id

  policy_document = data.aws_iam_policy_document.service_role_policy[0].json
}

######################
#  Kendra-Resources  #
######################

############# Kendra index creation #############
resource "awscc_kendra_index" "kendra_index" {
  count       = var.is_kendra ? 1 : 0
  edition     = var.kendra_index_edition
  name        = var.kendra_index_name
  role_arn    = awscc_iam_role.kendra_iam_role[0].arn
  description = var.kendra_index_description

  tags = local.terraform_tag
}

############# Kendra data source creation #############
resource "awscc_kendra_data_source" "kendra_datasource_s3" {
  count    = var.is_kendra ? 1 : 0
  index_id = awscc_kendra_index.kendra_index[0].id
  name     = var.kendra_ds_name
  role_arn = awscc_iam_role.kendra_iam_role[0].arn
  type     = "S3"

  data_source_configuration = {
    s3_configuration = {
      bucket_name = var.bucket_id
    }
  }

  tags = local.terraform_tag
}
