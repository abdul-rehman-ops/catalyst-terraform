locals {
  region         = "us-east-1"
  account_id     = "717251295998"
  role_name      = "terraform_deployer"
  vpc_cidr_block = "10.0.0.0/16"
  project_info   = ["${terraform.workspace}", "terraform"]
  public_subnets = {
    dev = {
      "10.0.0.0/24" = { az = "a" }
      "10.0.1.0/24" = { az = "b" }
      "10.0.2.0/24" = { az = "c" }
    }
  }[terraform.workspace]
  private_subnets = {
    dev = {
      "10.0.3.0/24" = { az = "a" }
      "10.0.4.0/24" = { az = "b" }
      "10.0.5.0/24" = { az = "c" }
    }
  }[terraform.workspace]
}