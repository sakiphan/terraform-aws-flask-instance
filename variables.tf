variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t2.micro"
}

variable "key_name" {
  description = "Key name for the EC2 instance"
}

variable "server_name" {
  description = "Name for the server"
  default = "flask-instance"
}

variable "tags" {
  description = "Tags for AWS resources"
  type        = string
  default = "Flask-Instance"
}

variable "flask_instance_ports" {
  description = "Ports for Flask instance"
  type        = list(number)
  default = [22, 80, 8080]
}

