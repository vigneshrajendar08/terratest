module "Lambda" {
  source = "terraform-aws-modules/lambda/aws"

  environment_name        	= "dev"
  lambda_runtime          	= "nodejs14.x"
  lambda_timeout          	= "3"
  lambda_handler          	= "index.handler"
  lambda_memory_size      	= "3072"
  env_variables           	= "Value1"
  security_group          	= "sg-0bd624d3094269055"
  log_retention_days      	= "14"
  LambdaErrorThreshold	  	= "0.25"
  SNSTopic					        = "chukku"
  #EfsMountPath			      	= "your_efs_mount_path"
  #EfsAccessPointArn			  = "your_efs_access_point_arn"
  PackageType				        = "chukku.zip"
  #ReservedConcurrency	   	= your_reserved_concurrency
  #ProvisionedConcurrency  	= your_provisioned_concurrency
  #InsightsExtensionVersion	= "your_insights_extension_version"
  LambdaLayer1				      = "chukku.zip"
  #LambdaLayer2				      = "your_lambda_layer_2"


}
