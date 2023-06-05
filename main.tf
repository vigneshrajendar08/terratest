module "api_gateway_lambda_integration" {
  source  = "infrablocks/api-gateway-lambda-integration/aws"
  version = "2.0.0"

  region = "us-east-1"

  component             = "lambda-resource"
  deployment_identifier = "production"

  api_gateway_rest_api_id               = "x3H41ka22w"
  api_gateway_rest_api_root_resource_id = "321pyrfif2"

  lambda_function_name = "lambda-function"
}
