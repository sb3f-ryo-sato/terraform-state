locals {
  environment = "stage"
}

terraform {
  backend "s3" {
    region = "ap-northeast-1"

    bucket  = "rs-terraform-stage"
    key     = "terraform-state"
    encrypt = true

    dynamodb_table = "rs-terraform-stage"
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
