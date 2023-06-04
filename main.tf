module "my_example_module" {
  source        = "terraform-aws-modules/lambda/aws"
  #filename      = "lambda_function.zip"
  function_name = "lambda_function"
  handler       = "handler.handler"
  runtime       = "nodejs14.x"
}
