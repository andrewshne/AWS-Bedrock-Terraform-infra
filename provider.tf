terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.48"
    }
    awscc = {
      source  = "hashicorp/awscc"
      version = "~> 1.4.0"
    }
    opensearch = {
      source  = "opensearch-project/opensearch"
      version = "= 2.2.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "~> 0.6"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.6.0"
    }
  }
  required_version = "~> 1.5"
}

provider "opensearch" {
  url         = var.is_kb ? aws_opensearchserverless_collection.collection[0].collection_endpoint : 0
  healthcheck = false
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Environment = "Test"
      Project     = "Sapphire"
      Created_by  = "Terraform"
    }
  }
}
