module "api_gateway" {
  source = "terraform-aws-modules/apigateway-v2/aws"

  create = false # to disable all resources

  create_api_gateway               = true  # to control creation of API Gateway
  create_api_domain_name           = false  # to control creation of API Gateway Domain Name
  create_default_stage             = false  # to control creation of "$default" stage
  create_default_stage_api_mapping = false  # to control creation of "$default" stage and API mapping
  create_routes_and_integrations   = false  # to control creation of routes and integrations
  create_vpc_link                  = true  # to control creation of VPC link

}
