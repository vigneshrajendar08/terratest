data archive_file lambda {
  type        = "zip"
  source_file = "index.js"
  output_path = "lambda_function.zip"
}
module "lambda" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "5.0.0"
  filename      = "lambda_function.zip"
  function_name = "lambda_function"
  handler       = "handler.handler"
  runtime       = "nodejs14.x"
}
