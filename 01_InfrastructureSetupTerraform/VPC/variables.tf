# Define the VPC CIDR block
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

# Define the public subnet CIDR block
variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

# Define the private subnet CIDR block
variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

# Define the availability zone
variable "availability_zone" {
  description = "Availability zone for the subnets"
  type        = string
  default     = "ap-south-1a"
}