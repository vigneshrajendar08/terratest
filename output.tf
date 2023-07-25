# Output variables for the lambda module
output "lambda_function_name" {
  description = "The name of the Lambda function."
  value       = module.lambda.function_name
}

output "lambda_function_arn" {
  description = "The ARN (Amazon Resource Name) of the Lambda function."
  value       = module.lambda.arn
}

output "lambda_runtime" {
  description = "The runtime of the Lambda function."
  value       = var.lambda_runtime
}

output "lambda_handler" {
  description = "The handler function of the Lambda function."
  value       = module.lambda.handler
}
