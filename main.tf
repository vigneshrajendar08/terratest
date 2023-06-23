data archive_file lambda {
  type        = "zip"
  source_file = "index.js"
  output_path = "lambda_function.zip"
}
module "lambda" {
  source  = "cloudposse/lambda-function/aws"
  version = "0.5.1"
  filename      = "lambda_function.zip"
  function_name = "lambda_function"
  handler       = "handler.handler"
  runtime       = "nodejs14.x"
}
