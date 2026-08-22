variable "vpc_id" {}
variable "public_subnet_id" {}
variable "private_subnet_id" {}
variable "security_group_id" {}
variable "security_group_db_id" {}
variable "aws_iam_instance_profile" {}


resource "aws_key_pair" "my_key" {
  key_name   = var.key_name
  public_key = file(pathexpand(var.ssh_key_path)) 
  #~/.ssh/id_rsa.pub ./EC2/my-key.pub Adjust the path to your public key as needed
}

resource "aws_instance" "web_server" {
  ami                         = data.aws_ami.ubuntu.id # Replace with your region's AMI ID
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  key_name                    = aws_key_pair.my_key.key_name
  vpc_security_group_ids      = [var.security_group_id]
  iam_instance_profile        = var.aws_iam_instance_profile
  associate_public_ip_address = true

  tags = {
    Name = "web-server"
  }
}

resource "aws_instance" "db_server" {
  ami                    = data.aws_ami.ubuntu.id # Replace with your region's AMI ID
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [var.security_group_db_id]
  iam_instance_profile   = var.aws_iam_instance_profile

  tags = {
    Name = "db-server"
  }
}

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/../ansible/inventory/hosts.ini"
  content = templatefile("${path.module}/templates/inventory.tpl", {
    web_server_public_ip = aws_instance.web_server.public_ip
    db_server_private_ip = aws_instance.db_server.private_ip
    })
}

resource "local_file" "ansible_group_vars" {
  filename = "${path.module}/../../02_ConfigurationDeploymentAnsible/ansible/inventory/group_vars/generated.yml"
  content  = <<EOT
web_public_ip: ${aws_instance.web_server.public_ip}
db_private_ip: ${aws_instance.db_server.private_ip}
EOT
}