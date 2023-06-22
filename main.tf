
module "api-gateway" {
    source        = "clouddrove/api-gateway/aws"
    version       = "1.0.1"
    name          = "Nissan-Aop-api-gateway"
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

  name = "Nissan-Aop-nlb"

  load_balancer_type = "network"

  vpc_id  = "vpc-0f2ab3f641f1f73a0"
  subnets = ["subnet-092f810cc59683e1e", "subnet-0a5747a7c6ca78afa"]

  #access_logs = {
    #bucket = "Nissan-Aop-nlb-logs"
  }

