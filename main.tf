data archive_file lambda {
  type        = "zip"
  source_file = "index.js"
  output_path = "NissanAOP_lambdafunction.zip"
}
module "lambda" {
  source  = "cloudposse/lambda-function/aws"
  version = "0.5.1"
  filename      = "NissanAOP_lambdafunction.zip"
  function_name = "NissanAOP_lambdafunction"
  handler       = "handler.handler"
  runtime       = "nodejs14.x"
}
