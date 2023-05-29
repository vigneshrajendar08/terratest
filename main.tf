module "nlb" {
  source  = "babbel/nlb-for-apigateway-vpc-link/aws"
  version = "~> 1.1"

  name = "example"

  vpc = aws_vpc.this

  cidr_blocks = {
    us-east-1a = cidrsubnet(aws_vpc.this, 8, 0)
    us-east-1b = cidrsubnet(aws_vpc.this, 8, 1)
  }

  tags = {
    app = "example"
    env = "test"
  }
}
