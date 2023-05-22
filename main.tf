data "archive_file" "zip" {
  type        = "zip"
  source_file = "hello_lambda.py"
  output_path = "hello_lambda.zip"
}

resource "aws_lambda_function" "my_lambda" {
  function_name = "Nissan-Aop-Lambda-Function"
  runtime       = "python3.8"
  handler       = "lambda_handler"
  role          = aws_iam_role.lambda_role.arn
  filename         = "${data.archive_file.zip.output_path}"
  source_code_hash = "${data.archive_file.zip.output_base64sha256}"
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda-role"
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

environment {
    variables = {
      greeting = "Hello"
    }
  }
}
