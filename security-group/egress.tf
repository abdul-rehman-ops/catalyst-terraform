# resource "aws_security_group_rule" "egress" {
#   for_each = { for idx, rule in var.egress_rules : idx => rule }

#   type              = "egress"
#   from_port         = each.value.from_port
#   to_port           = each.value.to_port
#   protocol          = each.value.protocol
#   cidr_blocks       = lookup(each.value, "cidr_blocks", null)
#   ipv6_cidr_blocks  = lookup(each.value, "ipv6_cidr_blocks", null)
#   description       = lookup(each.value, "description", null)
#   security_group_id = aws_security_group.this.id
#   self              = lookup(each.value, "self", false)
# }