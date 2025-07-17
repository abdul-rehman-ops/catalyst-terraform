# module "app_sg" {
#   source = "./security-group"

#   name        = "app-sg"
#   vpc_id      = aws_vpc.main.id
#   description = "SG for App Server"

#   ingress_rules = [
#     {
#       from_port   = 22
#       to_port     = 22
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#       description = "Allow SSH"
#     },
#     {
#       from_port   = 80
#       to_port     = 80
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#       description = "HTTP access"
#     }
#   ]

#   egress_rules = [
#     {
#       from_port   = 0
#       to_port     = 0
#       protocol    = "-1"
#       cidr_blocks = ["0.0.0.0/0"]
#       description = "Allow all outbound traffic"
#     }
#   ]

#   tags = {
#     Project     = "Queryosity"
#     Environment = "dev"
#   }
# }
