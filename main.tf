module "sns_topic" {
  source  = "terraform-aws-modules/sns/aws"

  name  = "Nissan-Aop"

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }

subscriptions = {
    sns = {
      protocol = "lambda"
      endpoint = "arn:aws:lambda:us-east-1:579484639223:function:testforssns"
    }
  }
  
}  
