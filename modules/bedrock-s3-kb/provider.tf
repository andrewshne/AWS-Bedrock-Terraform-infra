terraform {
  required_providers {
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
}

provider "opensearch" {
  url         = var.is_kb ? aws_opensearchserverless_collection.collection[0].collection_endpoint : 0
  healthcheck = false
}
