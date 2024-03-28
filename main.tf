provider "aws" {
  region = var.region
}

data "aws_ami" "amazon-linux-2023" {
  owners      = ["amazon"]
  most_recent = true

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
   filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }
}

resource "aws_instance" "flask_instance" {
  ami                    = data.aws_ami.amazon-linux-2023.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.flask_sg.id]
  user_data              = templatefile("${path.module}/userdata.sh", { myserver = var.server_name })

  tags = {
    Name = var.tags
  }
}

resource "aws_security_group" "flask_sg" {
  name        = "${var.tags}-flask-security-group"
  description = "Security group for the Flask instance"

  dynamic "ingress" {
    for_each = var.flask_instance_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.tags
  }
}