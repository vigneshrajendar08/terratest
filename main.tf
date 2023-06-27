module "apigateway-v2" {
  source  = "terraform-aws-modules/apigateway-v2/aws"
  version = "2.2.2"

  name        = "aop-dev-api-gateway"
  description = "nissan-aop-api-gateway"

  domain_name = var.domain_name
  domain_name_certificate_arn = var.domain_name_certificate_arn

  protocol_type = "HTTP"

  tags = {
    Environment = "aop-dev"
  }
}
