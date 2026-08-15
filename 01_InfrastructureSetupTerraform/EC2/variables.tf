
# Define the aws region variable
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

# Define the instance type
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

# Define the key pair name
variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
  sensitive   = true
}

# Define the number of instances
variable "instance_count" {
  description = "Number of EC2 instances to launch"
  type        = number
  default     = 1
}