# Terraform Module: AWS EC2 Instance with Flask

This Terraform module provisions an AWS EC2 instance with the latest Amazon Linux 2023 AMI and sets up Flask on it.

## Usage

```hcl
provider "aws" {
  region = "us-east-1"
}

module "docker_instance" {
    source   = "sakiphan/flask-instance/aws"
    key_name = "terraform-key"
}
```
In the above example, you can create an EC2 instance with Flask installed using this module. You need to provide values for region, instance_type, key_name, server_name, tags, and flask_instance_ports as per your requirements.