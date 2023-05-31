module "label" {
  source  = "cloudposse/label/null"
  # Cloud Posse recommends pinning every module to a specific version, though usually you want to use the current one
  #version = "0.13.0"

  namespace = "eg"
  name      = "example"
}

module "route53_chukku" {
  source  = "cloudposse/route53-cluster-hostname/aws"
  # Cloud Posse recommends pinning every module to a specific version
  #version = "0.13.0"

  zone_id = "Z3SO0TKDDQ0RGG"
  type    = "CNAME"

  records = [
    "test-chukku-hostname",
  ]

  context = module.label.context
}
