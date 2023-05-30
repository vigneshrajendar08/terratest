module "nlb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name = "chukku-nlb"

  load_balancer_type = "network"

  vpc_id  = "vpc-0f2ab3f641f1f73a0"
  subnets = ["subnet-092f810cc59683e1e", "subnet-0a5747a7c6ca78afa"]

  #access_logs = {
    #bucket = "chukku-nlb-logs"
  }
