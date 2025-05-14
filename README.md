# AWS-Bedrock-Terraform-infra

License MIT for educational purposes

## Short description

This Terraform code is to create a Bedrock Knowledge base to act as a retriever for Bedrock models for RAG architectures.

Important note, this code has the option to create either AWS Bedrock Knowledge base (currently supported only for S3 bucket as data source),
and AWS Kendra (Currently supported for S3 as data source) or both.

To initiate either of them, input the following tfvars (or on tf apply command):

* `is_kb = true` for AWS Bedrock Knowledge base infra creation
* `is_kendra = false` for AWS Kendra creation
* Keep both in `true` to create both of them

## Directory tree

```bash
├── 01-s3.tf
├── 02-bedrock-kb.tf
├── 03-kendra.tf
├── backend
│   ├── main.tf
│   ├── output.tf
│   └── provider.tf
├── beckend.tf
├── data.tf
├── extract.tf
├── locals.tf
├── modules
│   ├── bedrock-s3-kb
│   │   ├── data.tf
│   │   ├── DOC.md
│   │   ├── locals.tf
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── provider.tf
│   │   ├── README.md
│   │   ├── utility.tf
│   │   └── variables.tf
│   ├── kendra-s3
│   │   ├── data.tf
│   │   ├── locals.tf
│   │   ├── main.tf
│   │   ├── output.tf
│   │   ├── providers.tf
│   │   ├── README.md
│   │   └── variabels.tf
│   └── s3-bucket
│       ├── main.tf
│       ├── modules
│       │   ├── notification
│       │   │   ├── main.tf
│       │   │   ├── outputs.tf
│       │   │   ├── README.md
│       │   │   ├── variables.tf
│       │   │   └── versions.tf
│       │   └── object
│       │       ├── main.tf
│       │       ├── outputs.tf
│       │       ├── README.md
│       │       ├── variables.tf
│       │       └── versions.tf
│       ├── outputs.tf
│       └── variables.tf
├── output.tf
├── provider.tf
├── README.md
└── variables.tf
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name                                                                         | Version  |
| ---------------------------------------------------------------------------- | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform)    | ~> 1.5   |
| <a name="requirement_aws"></a> [aws](#requirement\_aws)                      | ~> 5.48  |
| <a name="requirement_awscc"></a> [awscc](#requirement\_awscc)                | ~> 1.4.0 |
| <a name="requirement_opensearch"></a> [opensearch](#requirement\_opensearch) | = 2.2.0  |
| <a name="requirement_random"></a> [random](#requirement\_random)             | >= 3.6.0 |
| <a name="requirement_time"></a> [time](#requirement\_time)                   | ~> 0.6   |

## Providers

| Name                                                    | Version |
| ------------------------------------------------------- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws)       | ~> 5.48 |
| <a name="provider_local"></a> [local](#provider\_local) | n/a     |

## Modules

| Name                                                              | Source                  | Version |
| ----------------------------------------------------------------- | ----------------------- | ------- |
| <a name="module_bedrock"></a> [bedrock](#module\_bedrock)         | ./modules/bedrock-s3-kb | n/a     |
| <a name="module_ds_bucket"></a> [ds\_bucket](#module\_ds\_bucket) | ./modules/s3-bucket     | n/a     |
| <a name="module_kendra"></a> [kendra](#module\_kendra)            | ./modules/kendra-s3     | n/a     |

## Resources

| Name                                                                                                          | Type        |
| ------------------------------------------------------------------------------------------------------------- | ----------- |
| [local_file.oss_id_op](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file)    | resource    |
| [local_file.s3_bucket_op](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource    |
| [aws_region.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region)      | data source |

## Inputs

| Name                                                                                               | Description                                                  | Type     | Default                          | Required |
| -------------------------------------------------------------------------------------------------- | ------------------------------------------------------------ | -------- | -------------------------------- | :------: |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name)                                       | Environment name                                             | `string` | n/a                              |   yes    |
| <a name="input_is_kb"></a> [is\_kb](#input\_is\_kb)                                                | boolean value for deploying knowledge base infra             | `bool`   | n/a                              |   yes    |
| <a name="input_is_kendra"></a> [is\_kendra](#input\_is\_kendra)                                    | boolean value for deploying kendra index infra               | `bool`   | n/a                              |   yes    |
| <a name="input_kb_model_id"></a> [kb\_model\_id](#input\_kb\_model\_id)                            | The ID of the foundational model used by the knowledge base. | `string` | `"amazon.titan-embed-text-v2:0"` |    no    |
| <a name="input_kendra_index_edition"></a> [kendra\_index\_edition](#input\_kendra\_index\_edition) | Choice type for index edition                                | `string` | `"DEVELOPER_EDITION"`            |    no    |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name)                           | Project Name                                                 | `string` | n/a                              |   yes    |
| <a name="input_region"></a> [region](#input\_region)                                               | AWS region                                                   | `string` | n/a                              |   yes    |

## Outputs

| Name                                                                                                            | Description                                   |
| --------------------------------------------------------------------------------------------------------------- | --------------------------------------------- |
| <a name="output_ds_id"></a> [ds\_id](#output\_ds\_id)                                                           | Data Source ID                                |
| <a name="output_ds_s3_bucket"></a> [ds\_s3\_bucket](#output\_ds\_s3\_bucket)                                    | Knowledge Base Data Source linked bucket name |
| <a name="output_is_kb"></a> [is\_kb](#output\_is\_kb)                                                           | n/a                                           |
| <a name="output_kb_id"></a> [kb\_id](#output\_kb\_id)                                                           | Knowledge Base ID                             |
| <a name="output_kendra_datasource_s3_id"></a> [kendra\_datasource\_s3\_id](#output\_kendra\_datasource\_s3\_id) | Kendra data source s3 id                      |
| <a name="output_kendra_index_id"></a> [kendra\_index\_id](#output\_kendra\_index\_id)                           | Kendra index id                               |
| <a name="output_opensearch_url"></a> [opensearch\_url](#output\_opensearch\_url)                                | n/a                                           |
| <a name="output_oss_collection_id"></a> [oss\_collection\_id](#output\_oss\_collection\_id)                     | OSS Collection ID                             |
| <a name="output_oss_host_name"></a> [oss\_host\_name](#output\_oss\_host\_name)                                 | OSS COllection hostname URL                   |
| <a name="output_oss_index_id"></a> [oss\_index\_id](#output\_oss\_index\_id)                                    | OSS Collection ID                             |
<!-- END_TF_DOCS -->

## Create a remote backend

Go to backend dir before running any terraform

```bash
cd backend/
```

Make sure you are connected to the AWS Account either by using `aws configure` or doing export keys from the SSO console.

Initiate the Terraform for the backend

```bash
terraform init
```

Apply the backend terraform in the account you are connected to apply the backend resources

```bash
terraform apply
```

When the creation completed copy the S3 bucket name and the dynamoDB table name and paste them in their corresponding fields in the `backend.tf` file

```bash
terraform {
  backend "s3" {
    bucket  = "" # REPLACE WITH YOUR S3 BUCKET NAME
    key     = "state/terraform.tfstate"
    region  = var.region
    encrypt = false
    dynamodb_table = "" # REPLACE WITH YOUR DYNAMODB TABLE NAME
  }
}
```

## For TF Vars

The main inputs needed for this project are the following tfvars (The values seen here are the default values of the variables):

```bash
env_name             = "test"
project_name         = "bedrock"
region               = "us-east-1"
is_kb                = true 
is_kendra            = false
kb_model_id          = "amazon.titan-embed-text-v2:0"
kendra_index_edition = "DEVELOPER_EDITION"
```


### NOTE

* There is also an `extract.tf`, for use cases where the output of s3 bucket name and AWS Bedrock Knowledge Base ID are needed, and put to local file to automation purposes.

* Make sure that the retriever is ready with data synced, for the scope of this project data will not be provided, this is up to whoever clones this repo and wish to run this solution, to BYOD(Bring Your Own Data).
