resource "aws_lambda_function" "my_lambda_function" {
  function_name = "my-lambda-function"
  handler      = "index.handler"
  runtime      = "nodejs14.x"
  memory_size  = 128
  timeout      = 10
  role         = aws_iam_role.lambda_role.arn

  // Specify the code location for your Lambda function
  // You can use a local file or an S3 bucket
  filename         = "lambda_function.zip"  # Local file
  # or
  s3_bucket        = "my-lambda-bucket"  # S3 bucket name
  s3_key           = "lambda_function.zip"  # S3 object key
  # or
  # specify "image_uri" if using a container image
}

resource "aws_iam_role" "lambda_role" {
  name = "my-lambda-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
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

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
  
