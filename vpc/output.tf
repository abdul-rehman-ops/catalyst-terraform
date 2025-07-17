output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_ids" {
  value = [for subnet in keys(var.public_subnets) : aws_subnet.public-subnet[subnet].id]
}

output "private_subnet_ids" {
  value = [for subnet in keys(var.private_subnets) : aws_subnet.private-subnet[subnet].id]
}
output "private_subnet_cidr_blocks" {
  value = [for subnet in keys(var.private_subnets) : aws_subnet.private-subnet[subnet].cidr_block]
}
output "igw_id" {
  value = aws_internet_gateway.ig.id
}

output "nat_gw_id" {
  value = var.enable_nat == true ? aws_nat_gateway.nat[0].id : null
}

output "public_route_table_id" {
  value = aws_route_table.public_rt.id
}

output "private_route_table_id" {
  value = aws_route_table.private_rt.id
}