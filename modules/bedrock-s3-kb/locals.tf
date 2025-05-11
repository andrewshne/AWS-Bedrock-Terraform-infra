##########
# Locals #
##########

locals {
  account_id            = data.aws_caller_identity.current.account_id
  partition             = data.aws_partition.this.partition
  region                = data.aws_region.this.name
  region_name_tokenized = split("-", local.region)
  region_short          = "${substr(local.region_name_tokenized[0], 0, 2)}${substr(local.region_name_tokenized[1], 0, 1)}${local.region_name_tokenized[2]}"



  ### OSS Policies locals
  oss_security_policies = {
    "encryption" = {
      name = var.oss_encryption_policy_name
      policy = jsonencode({
        Rules = [
          {
            Resource = [
              "collection/${var.oss_collection_name}"
            ]
            ResourceType = "collection"
          }
        ],
        AWSOwnedKey = true
      })
    },
    "network" = {
      name = var.oss_network_policy_name
      policy = jsonencode([
        {
          Rules = [
            {
              ResourceType = "collection"
              Resource = [
                "collection/${var.oss_collection_name}"
              ]
            },
            {
              ResourceType = "dashboard"
              Resource = [
                "collection/${var.oss_collection_name}"
              ]
            }
          ]
          AllowFromPublic = true
        }
      ])
    }
  }
}
