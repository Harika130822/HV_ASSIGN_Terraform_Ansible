# Output the VPC ID
output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the created VPC"
}

# Output the VPC ARN
output "vpc_arn" {
  value       = aws_vpc.main.arn
  description = "The ARN of the created VPC"
}

# Output the Public Subnet ID
output "public_subnet_id" {
  value       = aws_subnet.public.id
  description = "The ID of the public subnet"
}

# Output the Public Subnet ARN
output "public_subnet_arn" {
  value       = aws_subnet.public.arn
  description = "The ARN of the public subnet"
}

# Output the Private Subnet ID
output "private_subnet_id" {
  value       = aws_subnet.private.id
  description = "The ID of the private subnet"
}

# Output the Private Subnet ARN
output "private_subnet_arn" {
  value       = aws_subnet.private.arn
  description = "The ARN of the private subnet"
}

# Output the Internet Gateway ID
output "internet_gateway_id" {
  value       = aws_internet_gateway.igw.id
  description = "The ID of the Internet Gateway"
}

# Output the Internet Gateway ARN
output "internet_gateway_arn" {
  value       = aws_internet_gateway.igw.arn
  description = "The ARN of the Internet Gateway"
}

# Output the NAT Gateway ID
output "nat_gateway_id" {
  value       = aws_nat_gateway.nat.id
  description = "The ID of the NAT Gateway"
}

# Output the Elastic IP ID for the NAT Gateway
output "nat_gateway_allocation_id" {
  value       = aws_nat_gateway.nat.allocation_id
  description = "The ID of the Elastic IP associated with the NAT Gateway"
}

# Output the Subnet ID where NAT Gateway is deployed
output "nat_gateway_subnet_id" {
  value       = aws_nat_gateway.nat.subnet_id
  description = "The ID of the subnet where the NAT Gateway is deployed"
}

# Output the Public Route Table ID
output "public_route_table_id" {
  value       = aws_route_table.public.id
  description = "The ID of the public route table"
}

# Output the Private Route Table ID
output "private_route_table_id" {
  value       = aws_route_table.private.id
  description = "The ID of the private route table"
}