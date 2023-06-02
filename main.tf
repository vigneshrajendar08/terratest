data archive_file lambda {
  type        = "zip"
  source_file = "index.js"
  output_path = "lambda_function.zip"
}
module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  filename      = "Nissan-Aop-lambda_function.zip"
  function_name = "Nissan-Aop-lambda"
  description   = "Nissan lambda function"
  handler       = "index.lambda_handler"
  runtime       = "nodejs14.x"

 
  tags = {
    Name = "Nissan-Aop-lambda"
  }
}
  
  

#module "lambda" {
  #source  = "cloudposse/lambda-function/aws"
  #version = "0.5.1"
  #filename      = "lambda_function.zip"
  #function_name = "lambda_function"
  #handler       = "handler.handler"
  #runtime       = "nodejs14.x"
#}
  
