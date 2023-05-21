resource "aws_lambda_function" "my_lambda" {
  function_name = "Nissan-Aop-Lambda-Function"
  runtime       = "Node.js 18.x "
  handler       = "lambda_handler"
  role          = aws_iam_role.lambda_role.arn
  filename      = "lambda_function.zip"
  #source_code_hash = filebase64sha256("lambda_function.zip")
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
