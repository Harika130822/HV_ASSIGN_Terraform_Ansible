# Reference the VPC module
module "vpc" {
  source = "../VPC" # Adjust the path to the VPC module as needed
}

resource "aws_key_pair" "my_key" {
  key_name   = var.key_name
  public_key = file("../EC2/my-key.pub") #~/.ssh/id_rsa.pub Adjust the path to your public key as needed
}

resource "aws_instance" "web_server" {
  ami           = data.aws_ami.amazon_linux.id # Replace with your region's AMI ID
  instance_type = var.instance_type
  subnet_id     = data.aws_subnet.public.id
  key_name      = aws_key_pair.my_key.key_name
  tags = {
    Name = "web-server"
  }
}

resource "aws_instance" "db_server" {
  ami           = data.aws_ami.amazon_linux.id # Replace with your region's AMI ID
  instance_type = var.instance_type
  subnet_id     = data.aws_subnet.private.id
  key_name      = aws_key_pair.my_key.key_name
  tags = {
    Name = "db-server"
  }
}