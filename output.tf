output "api_gateway_id" {
  description = "The ID of the API Gateway"
  value       = module.api_gateway.id
}

output "api_gateway_name" {
  description = "The name of the API Gateway"
  value       = module.api_gateway.name
}

output "api_gateway_protocol_type" {
  description = "The protocol type of the API Gateway"
  value       = module.api_gateway.protocol_type
}

output "api_gateway_domain_name" {
  description = "The domain name of the API Gateway"
  value       = module.api_gateway.domain_name
}

output "api_gateway_integrations" {
  description = "The integrations of the API Gateway"
  value       = module.api_gateway.integrations
}
