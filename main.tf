# Create the Lambda function
resource "aws_lambda_function" "my_lambda_function" {
  filename         = "my_lambda_function.zip"  # Replace with the path to your Lambda deployment package
  function_name    = "my_lambda_function"
  role             = aws_iam_role.my_lambda_role.arn
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
resource "aws_iam_role" "my_lambda_role" {
  name = "my_lambda_role"

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
  role       = aws_iam_role. my_lambda_role.my_lambda_role
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Create the Network Load Balancer (NLB)
resource "aws_lb" "lambda_nlb" {
  name               = "my-lambda-nlb"
  internal           = false
  load_balancer_type = "network"
  #subnets            = ["subnet-xxxxx", "subnet-yyyyy"]  # Replace with the desired subnet IDs
}

# Create the NLB listener
resource "aws_lb_listener" "lambda_nlb_listener" {
  load_balancer_arn = aws_lb.lambda_nlb.arn
  port              = 80  # Replace with the desired port number
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lambda_target_group.arn
  }
}

# Create the target group for the NLB
resource "aws_lb_target_group" "lambda_target_group" {
  name     = "my-lambda-target-group"
  port     = 80  # Replace with the desired port number
  protocol = "TCP"
  #vpc_id   = "vpc-xxxxx"  # Replace with the desired VPC ID

  health_check {
    interval            = 30
    path                = "/"
    port                = 80
    protocol            = "TCP"
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

# Create the NLB target group attachment for the Lambda function
resource "aws_lb_target_group_attachment" "lambda_target_attachment" {
  target_group_arn = aws_lb_target_group.lambda_target_group.arn
  target_id        = aws_lambda_function.my_lambda_function.arn
  port             = 80  # Replace with the desired port number
}
#Please note that you should replace the placeholder values like "subnet-xxxxx", "subnet-yyyyy", and "vpc-xxxxx" with the appropriate IDs for your AWS environment.

# Create the API Gateway REST API
resource "aws_api_gateway_rest_api" "Nissan_api" {
  name        = "Nissan_api"
  description = "My API"
}

# Create the VPC Link
resource "aws_api_gateway_vpc_link" "Nissan_Aop_Vpc_link" {
  name        = "Nissan_Aop_Vpc_link"
  description = "My VPC Link"
  target_arns = [aws_api_gateway_rest_api.Nissan_api.execution_arn]
  
  #subnet_ids = ["subnet-072ee44066e17bfa3", "subnet-08760d81dadc26de4"]  # Replace with the desired subnet IDs
  
  #security_group_ids = ["sg-0bd624d3094269055"]  # Replace with the desired security group IDs
}

# Create the API Gateway resource
resource "aws_api_gateway_resource" "Nissan_api_resource" {
  rest_api_id = aws_api_gateway_rest_api.Nissan_api.id
  parent_id   = aws_api_gateway_rest_api.Nissan_api.root_resource_id
  path_part   = "my-resource"
}

# Create the API Gateway method
resource "aws_api_gateway_method" "Nissan_api_method" {
  rest_api_id   = aws_api_gateway_rest_api.Nissan_api.id
  resource_id   = aws_api_gateway_resource.Nissan_api_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

# Create the Lambda integration for API Gateway
resource "aws_api_gateway_integration" "Nissan_api_integration" {
  rest_api_id             = aws_api_gateway_rest_api.Nissan_api.id
  resource_id             = aws_api_gateway_resource.Nissan_api_resource.id
  http_method             = aws_api_gateway_method.Nissan_api_method.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.my_lambda_function.invoke_arn
}

# Create the API Gateway deployment
resource "aws_api_gateway_deployment" "Nissan_api_deployment" {
  depends_on = [
        aws_api_gateway_method.Nissan_api_method,
        aws_api_gateway_integration.Nissan_api_integration
      ]
  rest_api_id = aws_api_gateway_rest_api.Nissan_api.id
  stage_name  = "test"
}
