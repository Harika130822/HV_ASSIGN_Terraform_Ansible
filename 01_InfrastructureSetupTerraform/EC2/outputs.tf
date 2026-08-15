output "web_server_instance_ids" {
  value       = [aws_instance.web_server.id]
  description = "The ID of the web server instance"
}

output "db_server_instance_ids" {
  value       = [aws_instance.db_server.id]
  description = "The ID of the db server instance"
}

# Output the public IP of the web server
output "web_server_public_ip" {
  value       = aws_instance.web_server.*.public_ip
  description = "The public IP addresses of the web server instances"
}