module "Lambda" {
  source = "terraform-aws-modules/lambda/aws"

  environment_name        	= var.EnvironmentName
  lambda_runtime          	= var.LambdaRuntime
  lambda_timeout          	= var.LambdaTimeOut
  lambda_handler          	= var.LambdaHandler
  lambda_memory_size      	= var.LambdaMemorySize
  env_variables           	= var.EnvVariables
  security_group          	= var.SecurityGroup
  log_retention_days      	= var.LogRetentionDays
  LambdaErrorThreshold	  	= var.LambdaErrorThreshold
  SNSTopic					= var.SNSTopic
  EfsMountPath				= var.EfsMountPath
  EfsAccessPointArn			= var.EfsAccessPointArn
  PackageType				= var.PackageType
  ReservedConcurrency		= var.ReservedConcurrency
  ProvisionedConcurrency	= var.ProvisionedConcurrency
  InsightsExtensionVersion	= var.InsightsExtensionVersion
  LambdaLayer1				= var.LambdaLayer1
  LambdaLayer2				= var.LambdaLayer2
  
}
