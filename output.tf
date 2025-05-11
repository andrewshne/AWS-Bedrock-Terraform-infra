###### Knowledge Base outputs
output "kb_id" {
  description = "Knowledge Base ID"
  value       = module.bedrock.kb_id
}
output "ds_id" {
  description = "Data Source ID"
  value       = module.bedrock.ds_id
}

output "oss_collection_id" {
  description = "OSS Collection ID"
  value       = module.bedrock.oss_collection_id
}

output "oss_index_id" {
  description = "OSS Collection ID"
  value       = module.bedrock.oss_index_id
}

output "oss_host_name" {
  description = "OSS COllection hostname URL"
  value       = module.bedrock.oss_host_name
}

output "ds_s3_bucket" {
  description = "Knowledge Base Data Source linked bucket name"
  value       = module.ds_bucket.s3_bucket_id
}

###### Kendra outputs
output "kendra_index_id" {
  description = "Kendra index id"
  value       = module.kendra.kendra_index_id
}

output "kendra_datasource_s3_id" {
  description = "Kendra data source s3 id"
  value       = module.kendra.kendra_datasource_s3_id
}


output "opensearch_url" {
  value = module.bedrock.opensearch_url
}

output "is_kb" {
  value = module.bedrock.is_kb
}
