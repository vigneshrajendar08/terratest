module "lambda" {
  source = "hashicorp/lambda/aws"

  filename      = "lambda_function.zip"
  function_name = "lambda_function"
  handler       = "handler.handler"
  runtime       = "nodejs14.x"
}
