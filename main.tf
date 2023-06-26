module "nlb" {
  source  = "terraform-aws-modules/nlb/aws"
  version = "2.6.0"

  name_prefix         = "chukku-visunlb-"
  load_balancer_type  = "network"
  vpc_id              = module.vpc.vpc_id
  subnets             = module.vpc.public_subnets

  tcp_listeners = [
    {
      port     = 80
      protocol = "TCP"
    }
  ]

  https_listeners = [
    {
      port                  = 443
      protocol              = "TLS"
      certificate_arn       = module.acm.acm_certificate_arn
      target_group_index    = 0
      ssl_policy            = "ELBSecurityPolicy-2016-08"
      force_destroy         = true
      target_group_timeout  = 10
      idle_timeout          = 60
    }
  ]

  target_groups = [
    {
      name_prefix            = "aop-dev-nlb"
      backend_protocol       = "TCP"
      backend_port           = 80
      target_type            = "instance"
      health_check_port      = 80
      health_check_protocol  = "TCP"
      health_check_path      = "/aop-dev-nlb/index.html"
      health_check_interval  = 30
      health_check_timeout   = 6
      health_check_threshold = 3
      health_check_healthy_threshold = 3
    }
  ]

  tags = {
    Environment = "aop-dev"
  }
}
