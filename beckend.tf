terraform {
  backend "s3" {
    bucket  = "" # REPLACE WITH YOUR S3 BUCKET NAME
    key     = "state/terraform.tfstate"
    region  = var.region
    encrypt = false
    dynamodb_table = "" # REPLACE WITH YOUR DYNAMODB TABLE NAME
  }
}
