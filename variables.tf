variable "domain_name" {
  description = "The custom domain name for the API Gateway"
  type        = string
  default     = "www.nissan-aop.chukkuda.xyz"
}

variable "domain_name_certificate_arn" {
  description = "The ARN of the ACM certificate for the custom domain name"
  type        = string
  default     = "arn:aws:acm-pca:us-east-1:579484639223:certificate-authority/3a6d585e-01bd-4a9c-be47-0b32e1e78784"
}
