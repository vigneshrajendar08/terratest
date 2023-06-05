data "aws_route53_zone" "nissanaop1" {
  name         = "nissanaop1.com"
  private_zone = true
}

module "zones" {
  source  = "terraform-aws-modules/route53/aws//modules/zones"
  version = "~> 2.0"

  zones = {
    "terraform-aws-modules-nissanaop1.com" = {
      comment = "terraform-aws-modules-nissanaop1.com (testing)"
      tags = {
        env = "testing"
      }
    }

    "nissanaop.com" = {
      comment = "nissanaop1.com"
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
        zone_id = data.aws_route53_zone.nissanaop1.zone_id
      }
    },
    {
      name    = ""
      type    = "A"
      ttl     = 300
      records = [
        "10.10.10.222",
      ]
    },
  ]

  depends_on = [module.zones]
}
