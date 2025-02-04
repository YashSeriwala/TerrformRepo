#VPC
IPv4_CIDR = "10.0.0.0/24"
instance_tenancy = "default"
first_subnet_cidr = "10.0.0.0/28"
second_subnet_cidr = "10.0.0.17/28"
third_subnet_cidr = "10.0.0.36/28"

tag = { "name" = "Terraform-VPC"}

instance_type = "t2.micro"