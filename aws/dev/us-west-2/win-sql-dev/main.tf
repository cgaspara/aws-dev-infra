provider "aws" {
  region = var.region
}

resource "aws_instance" "windows_vm" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [var.security_group_id]
  subnet_id              = var.subnet_id

  tags = {
    Name = var.instance_name
  }

  root_block_device {
    volume_size = 30
    volume_type = "gp2"
  }

  # Optional: Add user_data for bootstrapping
  # user_data = file("bootstrap.ps1")
}
