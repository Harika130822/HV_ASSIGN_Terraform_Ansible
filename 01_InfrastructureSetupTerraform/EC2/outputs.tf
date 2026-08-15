# Output the public IP of the web server
output "web_server_public_ip" {
  value       = aws_instance.web_server.*.public_ip
  description = "The public IP addresses of the web server instances"
}

# Output the instance IDs
output "web_server_instance_ids" {
  value       = aws_instance.web_server.*.id
  description = "The IDs of the web server instances"
}

# Output the private IPs of the instances
output "web_server_private_ips" {
  value       = aws_instance.web_server.*.private_ip
  description = "The private IP addresses of the web server instances"
}

# Output the private IP of the db server
output "db_server_public_ip" {
  value       = aws_instance.db_server.*.public_ip
  description = "The public IP addresses of the db server instances"
}

# Output the instance IDs
output "db_server_instance_ids" {
  value       = aws_instance.db_server.*.id
  description = "The IDs of the db server instances"
}

# Output the private IPs of the instances
output "db_server_private_ips" {
  value       = aws_instance.db_server.*.private_ip
  description = "The private IP addresses of the db server instances"
}