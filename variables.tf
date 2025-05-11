###### GLobal vars
variable "project_name" {
  description = "Project Name"
  type        = string
  default     = "test"
}

variable "env_name" {
  description = "Environment name"
  type        = string
  default     = "bedrock"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

###### Choice for type of infra to deploy vars
variable "is_kb" {
  description = "boolean value for deploying knowledge base infra"
  type        = bool
  default     = false
}

variable "is_kendra" {
  description = "boolean value for deploying kendra index infra"
  type        = bool
  default     = false
}

###### KB vars
variable "kb_model_id" {
  description = "The ID of the foundational model used by the knowledge base."
  type        = string
  default     = "amazon.titan-embed-text-v2:0"
}

###### Kendra vars
variable "kendra_index_edition" {
  description = "Choice type for index edition"
  type        = string
  default     = "DEVELOPER_EDITION"
}
