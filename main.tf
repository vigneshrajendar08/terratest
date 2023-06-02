module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "Nissan-Aop-lambda"
  description   = "Nissan lambda function"
  handler       = "index.lambda_handler"
  runtime       = "nodejs14.x"

  source_path = "../src/lambda-function1"

  tags = {
    Name = "Nissan-Aop-lambda"
  }
}
