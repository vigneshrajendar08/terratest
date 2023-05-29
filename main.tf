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
  
#module "api-gateway" {
    #source        = "clouddrove/api-gateway/aws"
    #version       = "1.0.1"
    #name          = "chukku-Aop-api-gateway"
    #environment   = "test"
    #label_order   = ["name", "environment"]
    #enabled       = true
    #vpc_endpoint_ids = ["private"]
    #vpc_link_names = ["Nissan-Aop-Vpc"]
    #vpc_link_tags =  {
      #value = "Nissan-Aop-Vpc"
    #}   

#}

module "api_gateway" {
  source = "terraform-aws-modules/apigateway-v2/aws"

  create = false # to disable all resources

  create_api_gateway               = true  # to control creation of API Gateway
  create_api_domain_name           = false  # to control creation of API Gateway Domain Name
  create_default_stage             = false  # to control creation of "$default" stage
  create_default_stage_api_mapping = false  # to control creation of "$default" stage and API mapping
  create_routes_and_integrations   = false  # to control creation of routes and integrations
  create_vpc_link                  = true  # to control creation of VPC link

  # ... omitted
}  
  
  
