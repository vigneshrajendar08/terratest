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
