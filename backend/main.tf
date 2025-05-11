
# Uncomment the following lines to enable KMS encryption for the S3 bucket
######################################
#--------------AWS KMS---------------#
######################################

# resource "aws_kms_key" "terraform-bucket-key" {
#   description             = "This key is used to encrypt bucket objects"
#   deletion_window_in_days = 10
#   enable_key_rotation     = true
# }

# resource "aws_kms_alias" "key-alias" {
#   name          = "alias/terraform-bucket-key"
#   target_key_id = aws_kms_key.terraform-bucket-key.key_id
# }

######################################
#-------------AWS Bucket-------------#
######################################

resource "aws_s3_bucket" "terraform-state-bucket" {
  bucket = "tf-state-${formatdate("YYYYMMDD", timestamp())}"

  lifecycle {
    prevent_destroy = true
  }
  tags = {
    Name = "S3 Remote Terraform State Store"
  }
}

resource "aws_s3_bucket_versioning" "tf-state-versioning" {
  bucket = aws_s3_bucket.terraform-state-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_ownership_controls" "terraform-state-bucket-controls" {
  bucket = aws_s3_bucket.terraform-state-bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "terraform-state-bucket-acl" {
  depends_on = [aws_s3_bucket_ownership_controls.terraform-state-bucket-controls]

  bucket = aws_s3_bucket.terraform-state-bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.terraform-state-bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# resource "aws_s3_bucket_server_side_encryption_configuration" "tf-state-bucket-encryption-config" {
#   bucket = aws_s3_bucket.terraform-state-bucket.id

#   rule {
#     apply_server_side_encryption_by_default {
#       kms_master_key_id = aws_kms_key.terraform-bucket-key.arn
#       sse_algorithm     = "aws:kms"
#     }
#   }
# }

######################################
#------------AWS DynamoDB------------#
######################################

resource "aws_dynamodb_table" "terraform_statelock" {
  name           = "tfstate_db_${formatdate("YYYYMMDD", timestamp())}"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name = "DynamoDB Terraform State Lock Table"
  }
}
