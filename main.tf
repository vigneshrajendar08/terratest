data archive_file lambda {
  type        = "zip"
  source_file = "index.js"
  output_path = "lambda_function.zip"
}

resource aws_iam_role iam {
  name = "iam_for_lambda_tf"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

module lambda {
  source = "github.com/terraform-module/terraform-aws-lambda?ref=v2.12.8"

  function_name  = "nissan-aop-lambda"
  filename       = data.archive_file.lambda.output_path
  description    = "description should be here"
  handler        = "index.handler"
  runtime        = "nodejs18.x"
  memory_size    = "128"
  concurrency    = "5"
  lambda_timeout = "20"
  log_retention  = "1"
  role_arn       = aws_iam_role.iam.arn

  environment = {
    Environment = "test"
  }

  tags = {
    Environment = "test"
  }
}
