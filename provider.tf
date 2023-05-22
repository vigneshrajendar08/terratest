terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.67.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  # Add your AWS credentials or use environment variables or other authentication methods
}

provider "aws" {
  alias  = "us-east-2"
  region = "us-east-2"
  # Add your AWS credentials or use environment variables or other authentication methods
}
