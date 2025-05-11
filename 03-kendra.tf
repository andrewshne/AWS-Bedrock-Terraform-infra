######################
#  Kendra-creation  #
######################
module "kendra" {
  source = "./modules/kendra-s3"

  is_kendra         = var.is_kendra
  bucket_arn        = module.ds_bucket.s3_bucket_arn
  bucket_id         = module.ds_bucket.s3_bucket_id
  role_name         = "${local.prefix_name}_kendra_iam_role"
  role_policy_name  = "${local.prefix_name}_kendra_role_policy"
  kendra_index_name = "${local.prefix_name}-index"
  kendra_ds_name    = "${local.prefix_name}-datasource-s3"
}