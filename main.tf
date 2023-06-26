module "apigateway-v2" {
  source  = "terraform-aws-modules/apigateway-v2/aws"
  version = "2.2.2"

  name        = "my-http-api-gateway"
  description = "My HTTP API Gateway"

  protocol_type = "HTTP"

  tags = {
    Environment = "Production"
  }
}
