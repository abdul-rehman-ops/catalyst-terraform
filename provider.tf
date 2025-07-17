terraform {
  backend "s3" {
    bucket  = "conrad-research-terraform-state"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

provider "aws" {
  region = local.region
  assume_role {
    role_arn     = "arn:aws:iam::${local.account_id}:role/${local.role_name}"
    session_name = "terraform-deploy"
  }
}