variable "vpc_cidr_block" {
  type = string
}
variable "public_subnets" {
  type = any
  default = []
}
variable "private_subnets" {
  type = any
  default = []
}
variable "public_route_table_cidr_block" {
  type    = string
  default = "0.0.0.0/0"
}
variable "private_route_table_cidr_block" {
  type    = string
  default = "0.0.0.0/0"
}
variable "project_info" {
  type = list(string)
}
variable "enable_nat" {
  type = bool
}