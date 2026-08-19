# Define the aws region variable
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

# Define the name for the security group
variable "security_group_name" {
  description = "Name of the security group"
  type        = string
  default     = "web-server-sg"
}

# Define the description for the security group
variable "security_group_description" {
  description = "Description of the security group"
  type        = string
  default     = "Security group for web server"
}

# Define the allowed ingress CIDR block
variable "allowed_cidr" {
  description = "CIDR block allowed for ingress traffic"
  type        = string
  default     = "0.0.0.0/0"
}

# Define the IAM role name
variable "iam_role_name" {
  description = "Name of the IAM role"
  type        = string
  default     = "web-server-role"
}

# Define the key pair name
variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
  sensitive   = true
}

variable "my_ip_cidr" {
  description = "Your IP address in CIDR notation for SSH access"
  type        = string
  default     = "103.164.161.6/32" # Replace with your actual IP address in CIDR format
}