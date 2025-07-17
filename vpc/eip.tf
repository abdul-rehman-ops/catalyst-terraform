resource "aws_eip" "eip" {
  count = var.enable_nat == true ? 1 : 0
  tags = {
    Name         = "${local.resource_name_prefix}_eip"
    Environment  = var.project_info[0]
    ResourceType = "EIP"
  }
}