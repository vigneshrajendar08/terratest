module "lambda" {
  source = "hashicorp/lambda/aws"

  name = "hello_world"
  runtime = "nodejs14.x"
  handler = "lambda_function.handler"
  code_size = 128
  memory_size = 128
  timeout = 300

  environment {
    "FOO" = "bar"
  }
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
