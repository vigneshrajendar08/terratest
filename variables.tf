variable "domain_name" {
  description = "The custom domain name for the API Gateway"
  type        = string
  default     = "www.nissan-aop.chukkuda.xyz"
}

variable "domain_name_certificate_arn" {
  description = "The ARN of the ACM certificate for the custom domain name"
  type        = string
  default     = "arn:aws:acm:us-east-1:579484639223:certificate/030b582f-cc4d-43a5-a881-bce1d44a1005"
}
