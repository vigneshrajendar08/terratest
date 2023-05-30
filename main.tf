data archive_file lambda {
  type        = "zip"
  source_file = "index.js"
  output_path = "lambda_function.zip"
}
module "lambda" {
  source  = "cloudposse/lambda-function/aws"
  #version = "xxxx"
  filename      = "lambda_function.zip"
  function_name = "lambda_function"
  handler       = "handler.handler"
  runtime       = "nodejs14.x"
}
  
module "api-gateway" {
    source        = "clouddrove/api-gateway/aws"
    version       = "1.0.1"
    name          = "chukku-Aop-api-gateway"
    environment   = "test"
    label_order   = ["name", "environment"]
    enabled       = true
    #vpc_endpoint_ids = ["private"]
    #vpc_link_names = ["Nissan-Aop-Vpc"]
    #vpc_link_tags =  {
      #value = "Nissan-Aop-Vpc"
    #}
  
}
