# Output the VPC ID
output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the created VPC"
}

# Output the Public Subnet ID
output "public_subnet_id" {
  value       = aws_subnet.public.id
  description = "The ID of the public subnet"
}

# Output the Private Subnet ID
output "private_subnet_id" {
  value       = aws_subnet.private.id
  description = "The ID of the private subnet"
}
