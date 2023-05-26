data "archive_file" "zip" {
  type        = "zip"
  source_file = "hello_lambda.py"
  output_path = "hello_lambda.zip"
}

resource "aws_iam_role" "lambda_role" {
  name = "nissan-lambda-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

module lambda {
  source = "github.com/terraform-module/terraform-aws-lambda?ref=v2.12.8"

  function_name  = "Nissan-Aop-Lambda-Function"
  filename       = data.archive_file.zip.output_path
  description    = "lambda function"
  handler        = "hello_lambda.lambda_handler"
  runtime        = "python3.8"
  memory_size    = "128"
  concurrency    = "5"
  lambda_timeout = "20"
  log_retention  = "1"
  role_arn       = aws_iam_role.lambda_role.arn
}
