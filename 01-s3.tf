########################
#  S3-Bucket-creation  #
########################
module "ds_bucket" {
  source = "./modules/s3-bucket"

  force_destroy = true
  bucket        = "${local.prefix_name}-${local.region_short}-ds"
  acl           = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }
}