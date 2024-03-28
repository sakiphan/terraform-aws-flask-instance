output "instance_ip" {
  value       = aws_instance.flask_instance.public_ip
  description = "The public IP address of the Flask instance"
}

output "instance_id" {
  value       = aws_instance.flask_instance.id
  description = "The instance ID of the Flask instance"
}

output "security_group_id" {
  value       = aws_security_group.flask_sg.id
  description = "The ID of the security group for the Flask instance"
}
