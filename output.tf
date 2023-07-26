output "api_gateway_id" {
  description = "The ID of the API Gateway"
  value       = module.api_gateway.api_gateway_id
}

output "api_gateway_endpoint" {
  description = "The endpoint URL of the API Gateway"
  value       = module.api_gateway.api_gateway_endpoint
}

output "api_gateway_execution_arn" {
  description = "The execution ARN of the API Gateway"
  value       = module.api_gateway.api_gateway_execution_arn
}

output "api_gateway_deployment_id" {
  description = "The deployment ID of the API Gateway"
  value       = module.api_gateway.api_gateway_deployment_id
}

output "api_gateway_domain_name" {
  description = "The domain name of the API Gateway"
  value       = module.api_gateway.api_gateway_domain_name
}

output "api_gateway_domain_name_certificate_arn" {
  description = "The ARN of the certificate used for the custom domain name"
  value       = module.api_gateway.api_gateway_domain_name_certificate_arn
}
