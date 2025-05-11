output "s3_bucket_name" {
  description = "Terraform state bucket name"
  value       = aws_s3_bucket.terraform-state-bucket.bucket
}
output "dynamodb_name" {
  description = "Terraform DynamoDB table name"
  value       = aws_dynamodb_table.terraform_statelock.name
}
