module "api_gateway" {
  source  = "terraform-aws-modules/apigateway-v2/aws"
  version = "2.2.2"
  name          = "aop-dev-http"
  description   = "nissan aop dev HTTP API Gateway"
  protocol_type = "HTTP"
  cors_configuration = {
    allow_headers = ["*"]
    allow_methods = ["*"]
    allow_origins = ["*"]
  }
  create_routes_and_integrations = true
  domain_name     = var.domain_name
  domain_name_certificate_arn = var.domain_name_certificate_arn

  integrations = {
    "POST /" = {
      lambda_arn             = var.lambda_arn
      payload_format_version = "2.0"
      timeout_milliseconds   = 12000
    }
    "GET /some-route-with-authorizer" = {
      integration_type = "HTTP_PROXY"
      integration_uri  = var.integration_uri
      authorizer_key   = var.authorizer_key
    }
    "DELETE /some-route" = {
      delete_route_lambda_arn = var.delete_route_lambda_arn
      payload_format_version = "2.0"
      timeout_milliseconds   = 12000
    }
  }
}
