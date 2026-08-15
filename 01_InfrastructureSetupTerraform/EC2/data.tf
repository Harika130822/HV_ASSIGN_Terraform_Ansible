# Fetch the latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # Amazon's official AMI owner ID
}

# Retrieve the VPC ID from the VPC module
data "aws_vpc" "main" {
  id = module.vpc.vpc_id
}

# Retrieve the public subnet ID from the VPC module
data "aws_subnet" "public" {
  id = module.vpc.public_subnet_id
}

# Retrieve the private subnet ID from the VPC module (if needed)
data "aws_subnet" "private" {
  id = module.vpc.private_subnet_id
}