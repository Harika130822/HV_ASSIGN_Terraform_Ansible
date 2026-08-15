module "vpc" {
  source = "../VPC" # Adjust the path to the VPC module as needed
}

resource "aws_instance" "web_server" {
  ami           = "ami-0c02fb55956c7d316" # Replace with your region's AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  key_name      = aws_key_pair.my_key.key_name
  tags = {
    Name = "web-server"
  }
}

resource "aws_instance" "db_server" {
  ami           = "ami-0c02fb55956c7d316" # Replace with your region's AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private.id
  key_name      = aws_key_pair.my_key.key_name
  tags = {
    Name = "db-server"
  }
}