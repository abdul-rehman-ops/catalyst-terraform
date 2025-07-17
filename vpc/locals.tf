data "aws_region" "current" {}

locals {

  resource_name_prefix = "${var.project_info[0]}_${var.project_info[1]}"

}
