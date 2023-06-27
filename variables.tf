variable "domain_name" {
  description = "The custom domain name for the API Gateway"
  type        = string
  default     = "*.chukkuda.xyz"
}

variable "domain_name_certificate_arn" {
  description = "The ARN of the ACM certificate for the custom domain name"
  type        = string
  default     = "arn:aws:acm:us-east-1:579484639223:certificate/ad804ca3-99af-46f9-b9d7-771b5f2b74cc"
}
