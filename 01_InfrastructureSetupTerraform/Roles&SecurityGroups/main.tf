# Reference the VPC module
module "vpc" {
  source = "../VPC" # Adjust the path to the VPC module as needed
}

# Reference the EC2Instance module
module "ec2" {
  source = "../EC2" # Adjust the path to the EC2 module as needed
}

resource "aws_security_group" "web_sg" {
  vpc_id = aws_vpc.main.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["YOUR_IP/32"]
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
  vpc_id = aws_vpc.main.id
  ingress {
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }
  tags = {
    Name = "db-sg"
  }
}

resource "aws_iam_role" "ec2_role" {
  name = "ec2-role"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
}