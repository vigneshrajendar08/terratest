module "nlb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name = "my-nlb"

  load_balancer_type = "network"

  vpc_id  = "vpc-0f2ab3f641f1f73a0"
  subnets = ["subnet-092f810cc59683e1e", "subnet-0a5747a7c6ca78afa"]

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
      certificate_arn    = "arn:aws:acm-pca:us-east-1:579484639223:certificate-authority/953bf15f-3dd7-472b-a927-e6759f784397"
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
