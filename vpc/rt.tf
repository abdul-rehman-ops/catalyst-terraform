resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.public_route_table_cidr_block
    gateway_id = aws_internet_gateway.ig.id
  }
  tags = {
    Name         = "${local.resource_name_prefix}_public_route_table"
    Environment  = var.project_info[0]
    ResourceType = "RT"
  }
  lifecycle {
    ignore_changes = [route]
  }
}

resource "aws_route_table_association" "public_rt_association" {
  for_each       = var.public_subnets
  subnet_id      = aws_subnet.public-subnet[each.key].id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name         = "${local.resource_name_prefix}_private_route_table"
    Environment  = var.project_info[0]
    ResourceType = "RT"
  }
}

resource "aws_route_table_association" "private_rt_association" {
  for_each       = var.private_subnets
  subnet_id      = aws_subnet.private-subnet[each.key].id
  route_table_id = aws_route_table.private_rt.id
}
resource "aws_route" "nat_gw" {
  count                 = var.enable_nat == true ? 1 : 0
  route_table_id         = aws_route_table.private_rt.id
  destination_cidr_block = var.private_route_table_cidr_block
  nat_gateway_id         = aws_nat_gateway.nat[count.index].id
}