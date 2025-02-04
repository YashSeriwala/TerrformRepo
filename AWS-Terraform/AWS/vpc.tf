resource "aws_vpc" "terraform-vpc" {
    cidr_block = var.IPv4_CIDR
    instance_tenancy = var.instance_tenancy

    tags = var.tag
}

resource "aws_subnet" "first-subnet" {
    vpc_id = aws_vpc.terraform-vpc.id
    cidr_block = var.first_subnet_cidr
    availability_zone = "us-east-1a"
    tags = {
      Name = "first-subnet"
    }
}

resource "aws_subnet" "second-subnet" {
    vpc_id = aws_vpc.terraform-vpc.id
    cidr_block = var.second_subnet_cidr
    availability_zone = "us-east-1a"
    tags = {
      Name = "second-subnet"
    }
}

resource "aws_subnet" "third_subnet" {
    vpc_id = aws_vpc.terraorm-vpc.id
    cidr_block = var.third_subnet_cidr.id
    availability_zone = "us-east-1a"
    tags = {
      Name = "second-subnet"
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.terraform-vpc.id

    tags = {
      Name = "new-igw"
    }
}

resource "aws_eip" "nat" {
  domain = "vpc"
}

resource "aws_nat_gateway" "ngt" {
    allocation_id = aws_eip.nat.id
    subnet_id = aws_subnet.first-subnet.id

    tags = {
      Name = "new-nat"
    }
}

resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.terraform-vpc.id
        
    tags = {
        Name = "public_rt"
    }
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id 
    }

}

resource "aws_route_table_association" "public_rt" {
    subnet_id = aws_subnet.first-subnet.id
    route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.terraform-vpc.id
        
    tags = {
        Name = "private_rt"
    }
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.ngt.id 
    }

}

resource "aws_route_table_association" "private_rt" {
    subnet_id = aws_subnet.second-subnet.id
    route_table_id = aws_route_table.private_rt.id
}


 