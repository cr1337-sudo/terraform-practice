// Output
output "server_public_ip" {
  description = "Nginx EC2 Instance public IP"
  value       = aws_instance.nginx-server.public_ip
}

output "server_public_dns" {
  description = "Nginx EC2 Instance public IP"
  value       = aws_instance.nginx-server.public_dns
}
