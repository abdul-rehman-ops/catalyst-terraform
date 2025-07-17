# variable "name" {
#   type        = string
#   description = "Name of the security group"
# }

# variable "description" {
#   type        = string
#   default     = "Managed by Terraform"
#   description = "Security group description"
# }

# variable "vpc_id" {
#   type        = string
#   description = "VPC ID to create the security group in"
# }

# variable "tags" {
#   type        = map(string)
#   default     = {}
#   description = "Tags to apply to the security group"
# }

# variable "ingress_rules" {
#   type = list(object({
#     from_port        = number
#     to_port          = number
#     protocol         = string
#     cidr_blocks      = optional(list(string))
#     ipv6_cidr_blocks = optional(list(string))
#     description      = optional(string)
#     self             = optional(bool)
#   }))
#   default = []
#   description = "List of ingress rules"
# }

# variable "egress_rules" {
#   type = list(object({
#     from_port        = number
#     to_port          = number
#     protocol         = string
#     cidr_blocks      = optional(list(string))
#     ipv6_cidr_blocks = optional(list(string))
#     description      = optional(string)
#     self             = optional(bool)
#   }))
#   default = []
#   description = "List of egress rules"
# }
