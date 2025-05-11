##########
# Locals #
##########
locals {
  account_id            = data.aws_caller_identity.current.account_id
  partition             = data.aws_partition.this.partition
  region                = data.aws_region.this.name
  region_name_tokenized = split("-", local.region)
  region_short          = "${substr(local.region_name_tokenized[0], 0, 2)}${substr(local.region_name_tokenized[1], 0, 1)}${local.region_name_tokenized[2]}"

  terraform_tag = [
    {
      key   = "Environment"
      value = "Test"
    },
    {
      key   = "Project"
      value = "Sapphire"
    },
    {
      key   = "Created_by"
      value = "Terraform"
    }
  ]
}
