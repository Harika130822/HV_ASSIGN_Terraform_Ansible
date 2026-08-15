# Reference the VPC module
module "vpc" {
  source = "../VPC" # Adjust the path to the VPC module as needed
}

# Reference the EC2Instance module
module "ec2" {
  source   = "../EC2" # Adjust the path to the EC2 module as needed
  key_name = var.key_name
}

resource "aws_security_group" "web_sg" {
  vpc_id = data.aws_vpc.main.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["103.164.161.6/32"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "web-sg"
  }
}

resource "aws_security_group" "db_sg" {
  vpc_id = data.aws_vpc.main.id
  ingress {
    from_port       = 27017
    to_port         = 27017
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }
  tags = {
    Name = "db-sg"
  }
}

resource "aws_iam_role" "web_server_role" {
  name               = "web_server_role"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
}

