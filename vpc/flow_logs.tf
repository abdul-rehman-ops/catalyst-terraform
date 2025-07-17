resource "aws_flow_log" "flow_logs" {
  count           = terraform.workspace == "prod" ? 1 : 0
  iam_role_arn    = aws_iam_role.flow_logs_role[0].arn
  log_destination = aws_cloudwatch_log_group.flow_logs_group[0].arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.vpc.id
}

resource "aws_cloudwatch_log_group" "flow_logs_group" {
  count = terraform.workspace == "prod" ? 1 : 0
  name  = "${local.resource_name_prefix}_vpc_flow_logs"
}

data "aws_iam_policy_document" "assume_role" {
  count = terraform.workspace == "prod" ? 1 : 0
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "flow_logs_role" {
  count              = terraform.workspace == "prod" ? 1 : 0
  name               = "${local.resource_name_prefix}_vpc_flow_logs"
  assume_role_policy = data.aws_iam_policy_document.flow_logs_policy[0].json
}

data "aws_iam_policy_document" "flow_logs_policy" {
  count = terraform.workspace == "prod" ? 1 : 0
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
    ]

    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "flow_logs_policy_attachment" {
  count  = terraform.workspace == "prod" ? 1 : 0
  name   = "${local.resource_name_prefix}_vpc_flow_logs"
  role   = aws_iam_role.flow_logs_role[0].id
  policy = data.aws_iam_policy_document.flow_logs_policy[0].json
}