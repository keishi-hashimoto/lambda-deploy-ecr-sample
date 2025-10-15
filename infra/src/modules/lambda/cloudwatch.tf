resource "aws_cloudwatch_log_group" "main" {
  name         = var.proj
  skip_destroy = false
}