module "api_gateway" {
  source = "terraform-aws-modules/apigateway-v2/aws"

  name          = "dev-http"
  description   = "My awesome HTTP API Gateway"
  protocol_type = "HTTP"

  cors_configuration = {
    allow_headers = ["content-type", "x-amz-date", "authorization", "x-api-key", "x-amz-security-token", "x-amz-user-agent"]
    allow_methods = ["*"]
    allow_origins = ["*"]
  }

  # Custom domain
  domain_name                 = "terraform-aws-modules.modules.tf"
  domain_name_certificate_arn = "arn:aws:acm:us-east-1:579484639223:certificate/ac534e5d-7d37-4b49-b244-18c3c4359043"

  # Routes and integrations
  integrations = {
    "POST /" = {
      lambda_arn             = "arn:aws:lambda:eu-west-1:052235179155:function:my-function"
      payload_format_version = "2.0"
      timeout_milliseconds   = 12000
    }

    "GET /some-route-with-authorizer" = {
      integration_type = "HTTP_PROXY"
      integration_uri  = "some url"
      authorizer_key   = "aws"
    }

    "$default" = {
      lambda_arn = "arn:aws:lambda:us-east-1:579484639223:function:testforssns"
    }
  }

  authorizers = {
    "aws" = {
      authorizer_type  = "JWT"
      identity_sources = "$request.header.Authorization"
      name             = "aws-auth"
      audience         = ["d6a38afd-45d6-4874-d1aa-3c5c558aqcc2"]
      issuer           = "https://sts.windows.net/aaee026e-8f37-410e-8869-72d9154873e4/"
    }
  }

  tags = {
    Name = "http-apigateway"
  }
}
