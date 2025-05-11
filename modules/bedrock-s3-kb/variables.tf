#################
#  Bucket vars  #
#################

variable "bucket_arn" {
  type        = string
  description = "Bucket ARN"
}

#######################################
#  Is Knowledge Base deployment flag  #
#######################################
variable "is_kb" {
  description = "boolean value  for deploying knowledge base infra"
  type        = bool
}

####################
#  KB global vars  #
####################
variable "kb_model_id" {
  description = "The ID of the foundational model used by the knowledge base."
  type        = string
  default     = "amazon.titan-embed-text-v2:0"
}

##############
#  IAM vars  #
##############
variable "iam_role_name" {
  description = "iam kb role name"
  type        = string
  default     = "example_AmazonBedrockExecutionRoleForKnowledgeBase_kb"
}

variable "iam_service_role_policy_name" {
  description = "iam kb service policy name"
  type        = string
  default     = "example_AmazonBedrockFoundationModelPolicyForKnowledgeBase_kb"
}

variable "iam_policy_to_s3_name" {
  description = "iam kb policy to s3 name"
  type        = string
  default     = "example_AmazonBedrockS3PolicyForKnowledgeBase_kb"
}

variable "iam_policy_to_oss_name" {
  description = "iam kb policy to oss name"
  type        = string
  default     = "example__AmazonBedrockOSSPolicyForKnowledgeBase_kb"
}

##############
#  OSS vars  #
##############

### OSS policy vars
variable "oss_access_policy_name" {
  description = "oss access policy name"
  type        = string
  default     = "collection-access-policy"
}

variable "oss_encryption_policy_name" {
  description = "oss encryption policy name"
  type        = string
  default     = "collection-encryption-policy"
}

variable "oss_network_policy_name" {
  description = "oss network policy name"
  type        = string
  default     = "collection-network-policy"
}

### OSS collection vars
variable "oss_collection_name" {
  description = "oss collection name"
  type        = string
  default     = "oss-collection"
}

variable "standby_replicas" {
  description = "stand by replicas for the OSS indexes (false is 0.5 OCUs and true is 2 OCUs), DISABLED | ENABLED"
  type        = string
  default     = "DISABLED"
}

### OSS index vars
variable "oss_index_name" {
  description = "oss index name"
  type        = string
  default     = "oss-index"
}

variable "number_of_shards" {
  description = "index number of shards"
  type        = string
  default     = "2"
}

variable "number_of_replicas" {
  description = "index number of replicas"
  type        = string
  default     = "0"
}

variable "index_knn_algo_param_ef_search" {
  description = "index knn algorithm parameters for search"
  type        = string
  default     = "512"
}

variable "knowledge_base_vector_name" {
  description = "kb vector name"
  type        = string
  default     = "example_kb_vector"
}

##############
#  KB vars  #
##############
variable "kb_name" {
  description = "Knowledge Base name"
  type        = string
  default     = "example_kb"
}

variable "kb_ds_name" {
  description = "Knowledge Base data source name"
  type        = string
  default     = "example_kb_ds"
}


