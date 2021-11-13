locals {
  environment = "prod"
}

terraform {
  backend "s3" {
    region = "ap-northeast-1"

    bucket  = "rs-terraform-prod"
    key     = "terraform-state"
    encrypt = true

    dynamodb_table = "rs-terraform-prod"
  }
}

provider "aws" {
  region = "ap-northeast-1"

  default_tags {
    tags = {
      managed_by = "terraform"
    }
  }
}

module "terraform_state" {
  source = "../../modules/terraform-state"

  environment = local.environment
}
