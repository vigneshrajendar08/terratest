variable "domain_name" {
  description = "The domain name"
  type        = string
  default     = "*.chukkuda.xyz"    #Replace with the appropriate domain_name.
}

variable "domain_name_certificate_arn" {
  description = "The ARN (Amazon Resource Name) of the certificate"
  type        = string
  default     = "arn:aws:acm:us-east-1:1234:certificate/ad804ca3-99af-46f9-b9d7-771b5f2b74cc"  #Replace with the appropriate ARN.
}

variable "lambda_arn" {
  description = "The ARN (Amazon Resource Name) of the Lambda function"
  type        = string
  default     = "arn:aws:lambda:us-east-1:123456:function:aoplambdafunction" #Replace with the appropriate ARN.
}

variable "integration_uri" {
  description = "The integration URI for the 'GET /some-route-with-authorizer' route"
  type        = string
  default     = "http://gocool.godaddysites.com" #Replace with the appropriate URL.
}

variable "authorizer_key" {
  description = "The authorizer key for the 'GET /some-route-with-authorizer' route"
  type        = string
  default     = "azure"
}

variable "delete_route_lambda_arn" {
  description = "The ARN of the Lambda function for the 'DELETE /some-route' route"
  type        = string
  default     = "arn:aws:lambda:us-east-1:123456:function:aoplambdafunction" # Replace with the appropriate Lambda ARN.
}