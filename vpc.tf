module "vpc" {
  source          = "./vpc"
  vpc_cidr_block  = local.vpc_cidr_block
  private_subnets = local.private_subnets
  public_subnets  = local.public_subnets
  project_info    = local.project_info
  enable_nat = false
}