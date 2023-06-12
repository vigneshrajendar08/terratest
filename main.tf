module "lambda_function" {
  source        = "./path/to/lambda-module"
  function_name = "my-lambda-function"
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  source_code   = "./path/to/source_code"
}
