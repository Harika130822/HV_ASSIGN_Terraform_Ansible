# Output the security group ID
output "security_group_id" {
  value       = aws_security_group.web_sg.id
  description = "The ID of the security group for the web server"
}

# Output the IAM role ARN
output "iam_role_arn" {
  value       = aws_iam_role.web_server_role.arn
  description = "The ARN of the IAM role for the web server"
}

# Output the IAM role name
output "iam_role_name" {
  value       = aws_iam_role.web_server_role.name
  description = "The name of the IAM role for the web server"
}

# Output the security group ID
output "security_group_db_id" {
  value       = aws_security_group.db_sg.id
  description = "The ID of the security group for the database server"
}

output "aws_iam_instance_profile" {
  value       = aws_iam_instance_profile.web_server_instance_profile.name
  description = "The name of the IAM instance profile for the web server"
}
