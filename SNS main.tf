module "sns_topic" {
  source  = "terraform-aws-modules/sns/aws"

  name  = "Nissan-Aop"

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
