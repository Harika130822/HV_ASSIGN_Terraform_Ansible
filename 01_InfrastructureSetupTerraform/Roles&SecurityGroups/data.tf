# Retrieve the VPC ID from the VPC module
data "aws_vpc" "main" {
  id = module.vpc.vpc_id
}

# Retrieve the public subnet ID from the VPC module
data "aws_subnet" "public" {
  id = module.vpc.public_subnet_id
}

# Retrieve the private subnet ID from the VPC module
data "aws_subnet" "private" {
  id = module.vpc.private_subnet_id
}

# Retrieve the EC2 instance IDs from the EC2 module
data "aws_instance" "web_server" {
  instance_id = module.ec2.web_server_instance_ids[0]
}

data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}
