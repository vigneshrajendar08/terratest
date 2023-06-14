variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
  value		    = chukulambdafn
}

variable "handler" {
  description = "Name of the handler function"
  type        = string
  value		    = index.handler
}

variable "runtime" {
  description = "Runtime for the Lambda function"
  type        = string
  value		    = python3.8
}

variable "timeout" {
  description = "Timeout value for the Lambda function"
  type        = number
  value		    = 3
}

variable "memory_size" {
  description = "Memory size for the Lambda function"
  type        = number
  value		    = 128
}

variable "env_variables" {
  description = "Environment variables for the Lambda function"
  type        = map(string)
  default     = Value1
}

variable "security_group" {
  description = "Security group ID for the Lambda function"
  type        = string
  value		    = sg-0bd624d3094269055
}

variable "log_retention_days" {
  description = "Number of days to retain Lambda function logs"
  type        = number
  value		    = 14
}

variable "error_threshold" {
  description = "Error threshold for the Lambda function"
  type        = number
  value		    = 0.25
}

variable "sns_topic" {
  description = "ARN of the SNS topic for Lambda function errors"
  type        = string
  value		    = chukusns
}

variable "efs_mount_path" {
  description = "Mount path for the EFS file system"
  type        = string
  value		    = "/mnt/chukufiles"
}

variable "efs_access_point_arn" {
  description = "ARN of the EFS access point"
  type        = string
  value		    = arn:aws:elasticfilesystem:us-east-1:579484639223:access-point/fsap-001fa5a4a27906b30
}

variable "package_type" {
  description = "Package type for the Lambda function"
  type        = string
  value		    = chuku.zip
}

variable "reserved_concurrency" {
  description = "Reserved concurrency for the Lambda function"
  type        = number
  value		    = 5
}

variable "provisioned_concurrency" {
  description = "Provisioned concurrency for the Lambda function"
  type        = number
  default		    = 0
}

variable "insights_extension_version" {
  description = "Version of the AWS X-Ray Insights extension"
  type        = string
  default		  = arn:aws:lambda:us-east-1:579484639223:layer:LambdaInsightsExtension:38
}

variable "lambda_layers" {
  description = "List of Lambda layer ARNs"
  type        = list(string)
  default     = []
}

resource "aws_lambda_function" "lambda" {
  function_name    = var.function_name
  handler          = var.handler
  runtime          = var.runtime
  timeout          = var.timeout
  memory_size      = var.memory_size
  environment      = { variables = var.env_variables }
  vpc_config {
    security_group_ids = [var.security_group]
  }
  tracing_config {
    mode = "Active"
  }
  file_system_config {
    local_mount_path = var.efs_mount_path
    arn              = var.efs_access_point_arn
  }
  package_type                			= var.package_type
  reserved_concurrent_executions 		= var.reserved_concurrency
  provisioned_concurrent_executions	= var.provisioned_concurrency
  xray_tracing_enabled        			= true
  xray_log_group_name         			= aws_cloudwatch_log_group.lambda_log_group.name
  layers                      			= var.lambda_layers
}

resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name              = "/aws/lambda/${var.function_name}"
  retention_in_days = var.log_retention_days
}

resource "aws_cloudwatch_metric_alarm" "lambda_error_threshold_alarm" {
  alarm_name          = "${var.function_name}-error-threshold"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "Errors"
  namespace           = "AWS/Lambda"
  period              = 60
  statistic           = "SampleCount"
  threshold           = var.error_threshold
  alarm_description   = "Alarm when Lambda errors exceed the threshold"
  alarm_actions       = [var.sns_topic]
  dimensions = {
    FunctionName = aws_lambda_function.lambda.function_name
  }
}

output "lambda_function_arn" {
  description = "ARN of the created Lambda function"
  value       = aws_lambda_function.lambda.arn
}
