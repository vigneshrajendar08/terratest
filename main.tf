data archive_file lambda {
  type        = "zip"
  source_file = "index.js"
  output_path = "lambda_function.zip"
}
module "lambda" {
  source  = "cloudposse/lambda-function/aws"
  #version = "xxxx"
  filename      = "lambda_function.zip"
  function_name = "Nissan-Aop-function"
  handler       = "handler.handler"
  runtime       = "nodejs14.x"
}
  
module "api-gateway" {
    source        = "clouddrove/api-gateway/aws"
    version       = "1.0.1"
    name          = "Nissan-Aop-api-gateway"
    environment   = "test"
    label_order   = ["name", "environment"]
    enabled       = true
}
