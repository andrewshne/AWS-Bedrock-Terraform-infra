<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_opensearch"></a> [opensearch](#requirement\_opensearch) | = 2.2.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.6.0 |
| <a name="requirement_time"></a> [time](#requirement\_time) | ~> 0.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_opensearch"></a> [opensearch](#provider\_opensearch) | = 2.2.0 |
| <a name="provider_time"></a> [time](#provider\_time) | ~> 0.6 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_bedrockagent_data_source.ds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/bedrockagent_data_source) | resource |
| [aws_bedrockagent_knowledge_base.kb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/bedrockagent_knowledge_base) | resource |
| [aws_iam_role.kb_service_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.kb_service_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.kb_service_role_policy_to_oss](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy.kb_service_role_policy_to_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_opensearchserverless_access_policy.data_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/opensearchserverless_access_policy) | resource |
| [aws_opensearchserverless_collection.collection](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/opensearchserverless_collection) | resource |
| [aws_opensearchserverless_security_policy.security_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/opensearchserverless_security_policy) | resource |
| [opensearch_index.index](https://registry.terraform.io/providers/opensearch-project/opensearch/2.2.0/docs/resources/index) | resource |
| [time_sleep.policy_attach_sleep](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [aws_bedrock_foundation_model.kb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/bedrock_foundation_model) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.policy_to_oss](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.policy_to_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.service_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_arn"></a> [bucket\_arn](#input\_bucket\_arn) | Bucket ARN | `string` | n/a | yes |
| <a name="input_iam_policy_to_oss_name"></a> [iam\_policy\_to\_oss\_name](#input\_iam\_policy\_to\_oss\_name) | iam kb policy to oss name | `string` | `"example__AmazonBedrockOSSPolicyForKnowledgeBase_kb"` | no |
| <a name="input_iam_policy_to_s3_name"></a> [iam\_policy\_to\_s3\_name](#input\_iam\_policy\_to\_s3\_name) | iam kb policy to s3 name | `string` | `"example_AmazonBedrockS3PolicyForKnowledgeBase_kb"` | no |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | iam kb role name | `string` | `"example_AmazonBedrockExecutionRoleForKnowledgeBase_kb"` | no |
| <a name="input_iam_service_role_policy_name"></a> [iam\_service\_role\_policy\_name](#input\_iam\_service\_role\_policy\_name) | iam kb service policy name | `string` | `"example_AmazonBedrockFoundationModelPolicyForKnowledgeBase_kb"` | no |
| <a name="input_index_knn_algo_param_ef_search"></a> [index\_knn\_algo\_param\_ef\_search](#input\_index\_knn\_algo\_param\_ef\_search) | index knn algorithm parameters for search | `string` | `"512"` | no |
| <a name="input_is_kb"></a> [is\_kb](#input\_is\_kb) | boolean value  for deploying knowledge base infra | `bool` | n/a | yes |
| <a name="input_kb_ds_name"></a> [kb\_ds\_name](#input\_kb\_ds\_name) | Knowledge Base data source name | `string` | `"example_kb_ds"` | no |
| <a name="input_kb_model_id"></a> [kb\_model\_id](#input\_kb\_model\_id) | The ID of the foundational model used by the knowledge base. | `string` | `"amazon.titan-embed-text-v2:0"` | no |
| <a name="input_kb_name"></a> [kb\_name](#input\_kb\_name) | Knowledge Base name | `string` | `"example_kb"` | no |
| <a name="input_knowledge_base_vector_name"></a> [knowledge\_base\_vector\_name](#input\_knowledge\_base\_vector\_name) | kb vector name | `string` | `"example_kb_vector"` | no |
| <a name="input_number_of_replicas"></a> [number\_of\_replicas](#input\_number\_of\_replicas) | index number of replicas | `string` | `"0"` | no |
| <a name="input_number_of_shards"></a> [number\_of\_shards](#input\_number\_of\_shards) | index number of shards | `string` | `"2"` | no |
| <a name="input_oss_access_policy_name"></a> [oss\_access\_policy\_name](#input\_oss\_access\_policy\_name) | oss access policy name | `string` | `"collection-access-policy"` | no |
| <a name="input_oss_collection_name"></a> [oss\_collection\_name](#input\_oss\_collection\_name) | oss collection name | `string` | `"oss-collection"` | no |
| <a name="input_oss_encryption_policy_name"></a> [oss\_encryption\_policy\_name](#input\_oss\_encryption\_policy\_name) | oss encryption policy name | `string` | `"collection-encryption-policy"` | no |
| <a name="input_oss_index_name"></a> [oss\_index\_name](#input\_oss\_index\_name) | oss index name | `string` | `"oss-index"` | no |
| <a name="input_oss_network_policy_name"></a> [oss\_network\_policy\_name](#input\_oss\_network\_policy\_name) | oss network policy name | `string` | `"collection-network-policy"` | no |
| <a name="input_standby_replicas"></a> [standby\_replicas](#input\_standby\_replicas) | stand by replicas for the OSS indexes (false is 0.5 OCUs and true is 2 OCUs), DISABLED \| ENABLED | `string` | `"DISABLED"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ds_id"></a> [ds\_id](#output\_ds\_id) | Data Source ID |
| <a name="output_is_kb"></a> [is\_kb](#output\_is\_kb) | n/a |
| <a name="output_kb_id"></a> [kb\_id](#output\_kb\_id) | Knowledge Base ID |
| <a name="output_opensearch_url"></a> [opensearch\_url](#output\_opensearch\_url) | n/a |
| <a name="output_oss_collection_id"></a> [oss\_collection\_id](#output\_oss\_collection\_id) | OSS Collection ID |
| <a name="output_oss_host_name"></a> [oss\_host\_name](#output\_oss\_host\_name) | OSS COllection hostname URL |
| <a name="output_oss_index_id"></a> [oss\_index\_id](#output\_oss\_index\_id) | OSS Collection ID |
<!-- END_TF_DOCS -->