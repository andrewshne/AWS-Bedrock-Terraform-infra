###### Knowledge Base outputs
output "kb_id" {
  description = "Knowledge Base ID"
  value       = var.is_kb ? aws_bedrockagent_knowledge_base.kb[0].id : null
}
output "ds_id" {
  description = "Data Source ID"
  value       = var.is_kb ? aws_bedrockagent_data_source.ds[0].data_source_id : null
}

output "oss_collection_id" {
  description = "OSS Collection ID"
  value       = var.is_kb ? aws_opensearchserverless_collection.collection[0].id : null
}

output "oss_index_id" {
  description = "OSS Collection ID"
  value       = var.is_kb ? opensearch_index.index[0].id : null
}

output "oss_host_name" {
  description = "OSS COllection hostname URL"
  value       = var.is_kb ? aws_opensearchserverless_collection.collection[0].collection_endpoint : null
}

output "opensearch_url" {
  value = var.is_kb ? aws_opensearchserverless_collection.collection[0].collection_endpoint : null
}

output "is_kb" {
  value = var.is_kb
}
