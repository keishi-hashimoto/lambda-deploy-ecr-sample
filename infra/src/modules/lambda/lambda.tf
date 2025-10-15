resource "aws_lambda_function" "main" {
  function_name = var.proj
  package_type  = "Image"
  image_uri     = "${var.repository_url}:${var.tag}"
  role          = aws_iam_role.main.arn

  logging_config {
    log_format = "JSON"
    log_group  = aws_cloudwatch_log_group.main.name
  }

  lifecycle {
    ignore_changes = [image_uri]
  }
}

resource "aws_iam_role" "main" {
  name               = var.proj
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "main" {
  role       = aws_iam_role.main.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}