region             = "us-east-1"
instance_tenancy   = "default"
cidr_block         = "10.0.0.0/24"
public_subnet_cidr = ["10.0.0.0/28","10.0.0.16/28", "10.0.0.32/28"]
private_cidr_block = ["10.0.0.48/28","10.0.0.64/28","10.0.0.80/28"]
ami                = "ami-0c614dee691cbbf37"
instance_type      = "t2.micro"

//subnet_id = aws_subnet.public_subnet.id
