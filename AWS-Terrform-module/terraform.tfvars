region           = "us-east-1"
instance_tenancy = "default"
cidr_block       = "10.0.0.0/24"
# availability_zones ={
#     az1 = {
#         availability_zone = "us-east-1a"
#         public_subnet = "10.0.0.0/28"
#         private_subnet = "10.0.0.48/28"
#     },  
# }
public_subnet_cidr          = ["10.0.0.0/28", "10.0.0.16/28", "10.0.0.32/28"]
private_cidr_block          = ["10.0.0.48/28", "10.0.0.64/28", "10.0.0.80/28"]
ami                         = "ami-0c614dee691cbbf37"
instance_type               = "t2.micro"
availability_zone           = ["us-east-1a", "us-east-1b", "us-east-1c"]
associate_public_ip_address = true
# aws_security_group = data.aws_security_group.default.id
//subnet_id = aws_subnet.public_subnet.id
