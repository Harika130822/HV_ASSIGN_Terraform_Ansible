# Output the VPC ID
output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The ID of the created VPC"
}

# Output the Public Subnet ID
output "public_subnet_id" {
  value       = module.vpc.public_subnet_id
  description = "The ID of the public subnet"
}

# Output the Private Subnet ID
output "private_subnet_id" {
  value       = module.vpc.private_subnet_id
  description = "The ID of the private subnet"
}


# Output the security group ID
output "security_group_id" {
  value       = module.roles_and_security_groups.security_group_id
  description = "The ID of the security group for the web server"
}

# Output the IAM role ARN
output "iam_role_arn" {
  value       = module.roles_and_security_groups.iam_role_arn
  description = "The ARN of the IAM role for the web server"
}

# Output the IAM role name
output "iam_role_name" {
  value       = module.roles_and_security_groups.iam_role_name
  description = "The name of the IAM role for the web server"
}

# Output the security group ID
output "security_group_db_id" {
  value       = module.roles_and_security_groups.security_group_db_id
  description = "The ID of the security group for the database server"
}

output "web_server_instance_ids" {
  value       = [module.ec2.web_server_instance_ids]
  description = "The ID of the web server instance"
}

output "db_server_instance_ids" {
  value       = [module.ec2.db_server_instance_ids]
  description = "The ID of the db server instance"
}


output "web_server_public_ip" {
  value       = [module.ec2.web_server_public_ip]
  description = "The public IP addresses of the web server instances"
}

