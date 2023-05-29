data archive_file lambda {
  type        = "zip"
  source_file = "index.js"
  output_path = "lambda_function.zip"
}
module "lambda" {
  source  = "cloudposse/lambda-function/aws"
  #version = "xxxx"
  filename      = "lambda_function.zip"
  function_name = "lambda_function"
  handler       = "handler.handler"
  runtime       = "nodejs14.x"
}
  
module "api-gateway" {
    source        = "clouddrove/api-gateway/aws"
    version       = "1.0.1"
    name          = "chukku-Aop-api-gateway"
    environment   = "test"
    label_order   = ["name", "environment"]
    enabled       = true
    #vpc_endpoint_ids = ["private"]
    vpc_link_names = ["Nissan-Aop-Vpc"]
    #vpc_link_tags =  {
      #value = "Nissan-Aop-Vpc"
    #}
  
} 
  module "nlb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name = "chukku-nlb"

  load_balancer_type = "network"

  vpc_id  = "vpc-0f2ab3f641f1f73a0"
  subnets = ["subnet-092f810cc59683e1e", "subnet-0a5747a7c6ca78afa"]

  access_logs = {
    bucket = "chukku-nlb-logs"
  }

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "TCP"
      backend_port     = 80
      target_type      = "ip"
    }
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "TLS"
      certificate_arn    = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
      target_group_index = 0
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "TCP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "Test"
  }
}
