data "archive_file" lambda {
  type            = "zip"
  source_file     = var.lambda_source_file
  output_path     = var.lambda_output_path
}

module "lambda" {
  source          = "cloudposse/lambda-function/aws"
  version         = "0.5.1"
  filename        = data.archive_file.lambda.output_path
  function_name   = var.lambda_function_name
  handler         = var.lambda_handler
  runtime         = var.lambda_runtime
}
