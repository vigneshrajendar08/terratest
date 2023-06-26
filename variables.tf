variable "domain_name" {
  description = "The custom domain name for the API Gateway"
  type        = string
  default     = "chukkuda.xyz"
}

variable "domain_name_certificate_arn" {
  description = "The ARN of the ACM certificate for the custom domain name"
  type        = string
  default     = "arn:aws:acm:us-east-1:579484639223:certificate/ac534e5d-7d37-4b49-b244-18c3c4359043"
}
