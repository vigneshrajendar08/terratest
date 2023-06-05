data "aws_route53_zone" "nissanaop" {
  name         = "nissanaop.com"
  private_zone = true
}

module "zones" {
  source  = "terraform-aws-modules/route53/aws//modules/zones"
  version = "~> 2.0"

  zones = {
    "terraform-aws-modules-nissanaop.com" = {
      comment = "terraform-aws-modules-nissanaop.com (testing)"
      tags = {
        env = "testing"
      }
    }

    "nissanaop.com" = {
      comment = "nissanaop.com"
    }
  }

  tags = {
    ManagedBy = "Terraform"
  }
}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  zone_name = keys(module.zones.route53_zone_zone_id)[0]

  records = [
    {
      name    = "nissanaopapigateway"
      type    = "A"
      alias   = {
        name    = "d-10qxlbvagl.execute-api.us-east-1.amazonaws.com"
        zone_id = data.aws_route53_zone.nissanaop.zone_id
      }
    },
    {
      name    = ""
      type    = "A"
      ttl     = 3600
      records = [
        "10.10.10.10",
      ]
    },
  ]

  depends_on = [module.zones]
}
