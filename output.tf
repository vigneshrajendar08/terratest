output "api_gateway_id" {
  description = "ID of the API Gateway"
  value       = module.api_gateway.apigatewayv2_api_id
}

output "api_gateway_execution_arn" {
  description = "ARN of the API Gateway Execution"
  value       = module.api_gateway.apigatewayv2_api_execution_arn
}

output "api_gateway_api_endpoint" {
  description = "API Gateway endpoint URL"
  value       = module.api_gateway.apigatewayv2_api_api_endpoint
}
