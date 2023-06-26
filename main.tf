module "nlb_with_apigateway" {
  source  = "terraform-aws-modules/nlb/aws"
  version = "2.6.0"

  name_prefix        = "aopdev-nlb-apigateway-"
  load_balancer_type = "network"
  vpc_id             = module.vpc.vpc_id
  subnets            = module.vpc.public_subnets

  tcp_listeners = [
    {
      port     = 80
      protocol = "TCP"
    }
  ]

  target_groups = [
    {
      name_prefix       = "apigateway-nlb"
      backend_protocol  = "TCP"
      backend_port      = 80
      target_type       = "ip"
      target_ips        = module.apigateway.execution_arns
      health_check_port = 80
      health_check_protocol = "TCP"
      health_check_interval = 30
      health_check_timeout  = 10
      health_check_threshold = 3
      health_check_healthy_threshold = 3
    }
  ]

  tags = {
    Environment = "aop-dev"
    Project     = "aopdev-project"
  }
}
