resource "aws_vpc" "module_vpc" {
  cidr_block = var.cidr_block
  instance_tenancy = var.instance_tenancy
  tags = {
    Name = "module_vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.module_vpc.id
  count = 3
  availability_zone = var.availability_zone[count.index]
  cidr_block = var.public_subnet_cidr[count.index]
  # for_each = toset(var.public_subnet_cidr)
  # cidr_block = each.value
  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.module_vpc.id
  count = 3
  availability_zone = var.availability_zone[count.index]
  cidr_block = var.private_cidr_block[count.index]
  # for_each = toset(var.private_cidr_block)
  # cidr_block = each.value
  tags = {
    Name = "private_subnet"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.module_vpc.id
  tags = {
    Name = "public_rt"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.module_vpc.id
  tags = {
    Name = "private_rt"
  }
}

resource "aws_internet_gateway" "new-igw" {
  vpc_id = aws_vpc.module_vpc.id
  tags = {
    Name = "new-igw"
  }
}



# resource "aws_nat_gateway" "new" {
#   subnet_id = aws_subnet.public_subnet.id
#   connectivity_type = "public"
#   allocation_id = data.aws_nat_gateway.default
#   tags = {
#     Name = "new-nat"
#   }
# }

# resource "aws_nat_gateway" "default" {
#   allocation_id = aws_eip.nat.id
#   subnet_id     = aws_subnet.public_subnet.id
# }


# resource "aws_nat_gateway" "new" {
#   allocation_id = "eipalloc-02191f2e7896851e6"
#   subnet_id     = aws_subnet.public_subnet.id
#   tags = {
#     Name = "gw NAT"
#   }

#   # To ensure proper ordering, it is recommended to add an explicit dependency
#   # on the Internet Gateway for the VPC.
#   # depends_on = [aws_internet_gateway.example]
# }