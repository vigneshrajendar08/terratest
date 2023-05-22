# Create the API Gateway REST API
resource "aws_api_gateway_rest_api" "Nissan_api" {
  name        = "Nissan_api"
  description = "My API"
}

resource "aws_default_subnet" "default_az1" {
  availability_zone = "us-east-1a" "us-east-1b"

  tags = {
    Name = "Default subnet for us-east-1a" "us-east-1b"
  }
}

data "aws_security_group" "default" {
  default = true
}

#resource "aws_instance" "example" {
  #ami           = "ami-12345678"  # Replace with your desired AMI
  #instance_type = "t2.micro"
  #vpc_security_group_ids = [aws_security_group.example.id]
  #subnet_id = data.aws_vpc.default.default_subnet_id
}

resource "aws_vpc_endpoint" "my_endpoint" {
  vpc_id         = data.aws_vpc.default         # Replace with the ID of your VPC
  service_name   = "com.amazonaws.us-east-1.account"  # Replace with the desired service name
  vpc_endpoint_type = "Gateway"           # Replace with the desired endpoint type
  subnet_id = data.aws_vpc.default.default_subnet_id

  # Add additional configuration options as needed
}
