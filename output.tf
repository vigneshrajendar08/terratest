# output.tf

output "lambda_function_name" {
  description = "The name of the Lambda function."
  value       = module.lambda_function_name
}

output "lambda_function_arn" {
  description = "The ARN (Amazon Resource Name) of the Lambda function."
  value       = module.lambda_function_arn
}

output "lambda_function_runtime" {
  description = "The runtime of the Lambda function."
  value       = module.lambda_runtime
}

output "lambda_function_handler" {
  description = "The handler function of the Lambda function."
  value       = module.lambda_handler
}
