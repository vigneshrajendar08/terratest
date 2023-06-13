variable "EnvironmentName" {
  type        = string
  description = "Its a prefix which will be added to resource names."
  default     =  "dev"
}

variable "LambdaRuntime" {
  type        = string
  description = "Runtime environment for the Lambda Function"
  default     = "python3.8"
}

variable "LambdaTimeOut" {
  type        = number
  description = "The amount of time (in seconds) that Lambda allows a function to run before stopping it."
  default     = 3
}

variable "LambdaHandler" {
  type        = string
  description = "The name of the method within your code that Lambda calls to execute your function."
  default     = "index.handler"
}

variable "LambdaMemorySize" {
  type        = number
  description = "The amount of memory that the function has access to."
  default     = 128
}

variable "EnvVariables" {
  type        = string
  description = "Adds environment variables to a function as key-value pairs."
  default     = "Value1"
}

variable "SecurityGroup" {
  type        = string
  description = "Group ID of the Security Group to which the EC2 instances needs to be attached."
  default     = "sg-0bd624d3094269055"  
}

variable "LogRetentionDays" {
  type        = number
  description = "Days for which the lambda logs needs to be retained in Cloudwatch."
  default     = 14
}

variable "LambdaErrorThreshold" {
  type        = number
  description = "Provide the threshold required for Lambda error notifications."
  default     = 0.25
}

variable "SNSTopic" {
  type        = string
  description = "Provide the name of SNS Topic to which Cloudwatch alarms needs to be sent."
  default     = "Nissan-SNS"
}

variable "EfsMountPath" {
  type        = string
  description = "Provide the path where the function can access the file system, starting with /mnt/."
  default     = "/mnt/"
}

variable "EfsAccessPointArn" {
  type        = string
  description = "Provide the ARN of the Amazon EFS access point that provides access to the file system."
  default     = ""
}

variable "PackageType" {
  type        = string
  description = "Provide the type of package used for Lambda deployment - Zip or Image."
  default     = "Nissan.Zip"
}

variable "ReservedConcurrency" {
  type        = number
  description = "Provide the number of concurrent instances that are to be reserved for the lambda function."
  default     = 5
}

variable "ProvisionedConcurrency" {
  type        = number
  description = "Provide the number of provisioned concurrency to be set for this Lambda function."
  default     = 0
}

variable "InsightsExtensionVersion" {
  type        = string
  description = "Provide the version of the extension to be used for Lambda Insights."
  default     = "arn:aws:lambda:us-east-1:580247275435:layer:LambdaInsightsExtension:38"
}

variable "LambdaLayer1" {
  type        = string
  description = "Provide the name and version of the Layer that is to be attached to the function."
  default     = "Nissan.Zip"
}

variable "LambdaLayer2" {
  type        = string
  description = "Provide the name and version of the Layer that is to be attached to the function."
  default     = "Nissan.Zip"
}
