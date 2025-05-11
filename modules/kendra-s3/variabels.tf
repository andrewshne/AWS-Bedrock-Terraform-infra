#################
#  Bucket vars  #
#################

variable "bucket_arn" {
  type        = string
  description = "S3 Bucket ARN"
}

variable "bucket_id" {
  type        = string
  description = "S3 Bucket ID"
}

#######################################
#  Is Kendra deployment flag          #
#######################################
variable "is_kendra" {
  description = "boolean value for deploying Kendra infra"
  type        = bool
}

#############
# IAM vars  #
#############
variable "role_name" {
  description = "Kendra service role name"
  type        = string
  default     = "example_kendra_iam_role"
}

variable "role_policy_name" {
  description = "Kendra service role policy name"
  type        = string
  default     = "example_kendra_role_policy"
}

################
#  Kendra vars #
################
variable "kendra_index_name" {
  description = "Kendra index name"
  type        = string
  default     = "example-index"
}

variable "kendra_index_description" {
  description = "Kendra index description"
  type        = string
  default     = "Kendra index"
}

variable "kendra_index_edition" {
  description = "Kendra index edition set"
  type        = string
  default     = "DEVELOPER_EDITION"
}

variable "kendra_ds_name" {
  description = "Kendra data source name"
  type        = string
  default     = "example-datasource-s3"
}

