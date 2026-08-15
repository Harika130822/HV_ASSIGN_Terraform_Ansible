# Fetch the latest Ubuntu AMI
data "aws_ami" "ubuntu" {
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



# Retrieve the public subnet ID from the VPC module
data "aws_subnet" "public" {
  id = var.public_subnet_id
}

# Retrieve the private subnet ID from the VPC module
data "aws_subnet" "private" {
  id = var.private_subnet_id
}

