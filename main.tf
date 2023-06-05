module "lambda_api_gateway" {
  source               = "techjacker/terraform-aws-lambda-api-gateway"
# lambda
  lambda_zip_path      = "lambda/lambdafunction.zip"
  lambda_handler       = "handler.handler"
  lambda_runtime       = "nodejs14.x"
  lambda_function_name = "NissanAop"

  # API gateway
  region               = "us-east-1"
  account_id           = "579484639223"
}
