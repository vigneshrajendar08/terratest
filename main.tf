# Create the Lambda function
resource "aws_lambda_function" "chukkulambda" {
  filename         = "lambda.zip"  # Replace with the path to your Lambda deployment package
  function_name    = "chukkulambda-function"
  role             = aws_iam_role.lambda_role.arn
  handler          = "index.handler"
  runtime          = "nodejs14.x"  # Replace with your desired runtime

  # Specify the environment variables for your Lambda function (if any)
  environment {
    variables = {
      EXAMPLE_VARIABLE = "example_value"
    }
  }
}

# Create the IAM role for the Lambda function
resource "aws_iam_role" "lambda_role" {
  name = "my-lambda-role"

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

# Attach the required policies to the Lambda role
resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Create the API Gateway REST API
resource "aws_api_gateway_rest_api" "chukku_api" {
  name        = "chukku_api"
  description = "My API"
}

# Create the API Gateway resource
resource "aws_api_gateway_resource" "chukku_api_resource" {
  rest_api_id = aws_api_gateway_rest_api.chukku_api.id
  parent_id   = aws_api_gateway_rest_api.chukku_api.root_resource_id
  path_part   = "my-resource"
}

# Create the API Gateway method
resource "aws_api_gateway_method" "chukku_api_method" {
  rest_api_id   = aws_api_gateway_rest_api.chukku_api.id
  resource_id   = aws_api_gateway_resource.chukku_api_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

# Create the Lambda integration for API Gateway
resource "aws_api_gateway_integration" "chukku_api_integration" {
  rest_api_id             = aws_api_gateway_rest_api.chukku_api.id
  resource_id             = aws_api_gateway_resource.chukku_api_resource.id
  http_method             = aws_api_gateway_method.chukku_api_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.chukkulambda.invoke_arn
}

# Create the API Gateway deployment
resource "aws_api_gateway_deployment" "chukku_api_deployment" {
  rest_api_id = aws_api_gateway_rest_api.chukku_api.id
  stage_name  = "test"
}

