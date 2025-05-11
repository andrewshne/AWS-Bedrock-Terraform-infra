###### Kendra outputs
output "kendra_index_id" {
  description = "Kendra index id"
  value       = var.is_kendra ? awscc_kendra_index.kendra_index[0].id : null
}

output "kendra_datasource_s3_id" {
  description = "Kendra data source s3 id"
  value       = var.is_kendra ? awscc_kendra_data_source.kendra_datasource_s3[0].id : null
}
