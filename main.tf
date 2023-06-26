module "api_gateway" {
  source = "terraform-aws-modules/apigateway/aws"
  version = "~> 3.0"

  name        = "my-http-api-gateway"
  description = "My HTTP API Gateway"

  protocol_type = "HTTP"

  cors_enabled          = true
  cors_allow_origin     = "*"
  cors_allow_methods    = ["GET", "POST", "PUT", "DELETE"]
  cors_allow_headers    = ["*"]

  tags = {
    Environment = "Production"
  }
}
