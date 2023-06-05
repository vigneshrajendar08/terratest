module "lambda" {
  source = "hashicorp/lambda/aws"

  filename      = "lambda_function.zip"
  function_name = "lambda_function"
  handler       = "handler.handler"
  runtime       = "nodejs14.x"
}

module "api_gateway" {
  source = "hashicorp/api_gateway/aws"

  name = "hello_world"
  region = "us-east-1"

  rest_api {
    description = "A simple REST API"
  }

  method {
    resource_id = "${module.lambda.function_arn}"
    method_type = "GET"
    uri = "/"
  }
}
