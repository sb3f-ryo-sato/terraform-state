locals {
  environment = "stage"
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
