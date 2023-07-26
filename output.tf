output "api_gateway_url" {
  description = "URL of the API Gateway"
  value       = module.api_gateway.http_api_url
}

output "api_gateway_id" {
  description = "ID of the API Gateway"
  value       = module.api_gateway.http_api_id
}

output "api_gateway_execution_arn" {
  description = "ARN of the API Gateway Execution"
  value       = module.api_gateway.http_api_arn
}

output "api_gateway_api_endpoint" {
  description = "API Gateway endpoint URL"
  value       = var.api_gateway_api_endpoint
}
