data "aws_availability_zones" "available" {}

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "${local.resource_name_prefix}_vpc"
  }
}

resource "aws_subnet" "public-subnet" {
  for_each = var.public_subnets

  availability_zone = "${data.aws_region.current.name}${lookup(each.value, "az")}"
  cidr_block        = each.key
  vpc_id            = aws_vpc.vpc.id

  tags = {
    Name         = "${local.resource_name_prefix}_public_subnet_${lookup(each.value, "az")}"
    Environment  = var.project_info[0]
    Developer    = var.project_info[1]
    ResourceType = "SUBNET"
  }
}

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${local.resource_name_prefix}_internet_gateway"
  }
}

resource "aws_subnet" "private-subnet" {
  for_each = var.private_subnets

  availability_zone = "${data.aws_region.current.name}${lookup(each.value, "az")}"
  cidr_block        = each.key
  vpc_id            = aws_vpc.vpc.id

  tags = {
    Name                     = "${local.resource_name_prefix}_private_subnet_${lookup(each.value, "az")}"
    Environment              = var.project_info[0]
    Developer                = var.project_info[1]
    ResourceType             = "SUBNET"
  }
}