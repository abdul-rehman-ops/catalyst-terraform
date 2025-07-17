resource "aws_nat_gateway" "nat" {
  count           = var.enable_nat == true ? 1 : 0
  allocation_id = aws_eip.eip[count.index].id
  subnet_id     = aws_subnet.public-subnet[keys(var.public_subnets)[0]].id

  tags = {
    Name         = "${local.resource_name_prefix}_nat_gateway"
    Environment  = var.project_info[0]
    ResourceType = "NATGW"
  }

}
