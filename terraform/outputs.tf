output "ec2_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.compito_server.public_ip
}

output "ec2_public_dns" {
  description = "Public DNS of the EC2 instance"
  value       = aws_instance.compito_server.public_dns
}