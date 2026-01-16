provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "windows_vm" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true

  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "windows-sql-dev"
  }

  user_data = <<-EOF
              <powershell>
              # Enable WinRM
              winrm quickconfig -q
              winrm set winrm/config/service/auth '@{Basic="true"}'
              winrm set winrm/config/service '@{AllowUnencrypted="true"}'
              netsh advfirewall firewall add rule name="WinRM HTTP" dir=in action=allow protocol=TCP localport=5985
              </powershell>
              EOF
}
