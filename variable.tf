# variable.tf

# Input variables for the archive_file data block
variable "lambda_source_file" {
  description = "Path to the Lambda source code file."
  default     = "index.js"
}

variable "lambda_output_path" {
  description = "Output path for the Lambda zip archive."
  default     = "aopdev_lambdafunction.zip"
}

# Input variables for the lambda module
variable "lambda_function_name" {
  description = "Name of the Lambda function."
  default     = "aopdev_lambdafunction"
}

variable "lambda_handler" {
  description = "The handler function for the Lambda function."
  default     = "handler.handler"
}

variable "lambda_runtime" {
  description = "The runtime for the Lambda function."
  default     = "nodejs14.x"
}
