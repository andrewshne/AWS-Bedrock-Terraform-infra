<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.48 |
| <a name="requirement_awscc"></a> [awscc](#requirement\_awscc) | ~> 1.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.48 |
| <a name="provider_awscc"></a> [awscc](#provider\_awscc) | ~> 1.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [awscc_iam_role.kendra_iam_role](https://registry.terraform.io/providers/hashicorp/awscc/latest/docs/resources/iam_role) | resource |
| [awscc_iam_role_policy.kendra_iam_role_policy](https://registry.terraform.io/providers/hashicorp/awscc/latest/docs/resources/iam_role_policy) | resource |
| [awscc_kendra_data_source.kendra_datasource_s3](https://registry.terraform.io/providers/hashicorp/awscc/latest/docs/resources/kendra_data_source) | resource |
| [awscc_kendra_index.kendra_index](https://registry.terraform.io/providers/hashicorp/awscc/latest/docs/resources/kendra_index) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.role_trust](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.service_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_arn"></a> [bucket\_arn](#input\_bucket\_arn) | S3 Bucket ARN | `string` | n/a | yes |
| <a name="input_bucket_id"></a> [bucket\_id](#input\_bucket\_id) | S3 Bucket ID | `string` | n/a | yes |
| <a name="input_is_kendra"></a> [is\_kendra](#input\_is\_kendra) | boolean value for deploying Kendra infra | `bool` | n/a | yes |
| <a name="input_kendra_ds_name"></a> [kendra\_ds\_name](#input\_kendra\_ds\_name) | Kendra data source name | `string` | `"example-datasource-s3"` | no |
| <a name="input_kendra_index_description"></a> [kendra\_index\_description](#input\_kendra\_index\_description) | Kendra index description | `string` | `"Kendra index"` | no |
| <a name="input_kendra_index_edition"></a> [kendra\_index\_edition](#input\_kendra\_index\_edition) | Kendra index edition set | `string` | `"DEVELOPER_EDITION"` | no |
| <a name="input_kendra_index_name"></a> [kendra\_index\_name](#input\_kendra\_index\_name) | Kendra index name | `string` | `"example-index"` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | Kendra service role name | `string` | `"example_kendra_iam_role"` | no |
| <a name="input_role_policy_name"></a> [role\_policy\_name](#input\_role\_policy\_name) | Kendra service role policy name | `string` | `"example_kendra_role_policy"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kendra_datasource_s3_id"></a> [kendra\_datasource\_s3\_id](#output\_kendra\_datasource\_s3\_id) | Kendra data source s3 id |
| <a name="output_kendra_index_id"></a> [kendra\_index\_id](#output\_kendra\_index\_id) | Kendra index id |
<!-- END_TF_DOCS -->