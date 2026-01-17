aws_region         = "us-east-1"
ami_id             = "ami-0dba2cb6798deb6d8" # Windows Server 2022 Base – confirm this in AWS EC2 > AMIs
instance_type      = "t3.small"              # Free tier not supported for Windows, use small
key_name           = "keypair_sql-dev"
subnet_id          = "subnet-01ed5607fcb639b2a"       # Get this from your VPC > Subnets
security_group_id  = "sg-0bc0927aed80dcbe5"           # Allow RDP (3389) and WinRM (5985)
