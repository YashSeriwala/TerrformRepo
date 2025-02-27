variable "region" {

}

variable "cidr_block" {
  type = string
}

variable "instance_tenancy" {
  type = string
}

variable "public_subnet_cidr" {
  type = list(string)
}

variable "private_cidr_block" {
  type    = list(string)
  default = []
}

variable "instance_type" {
  type = string
}

variable "ami" {
  type = string
}

variable "availability_zone" {
  type = list(string)
}

variable "associate_public_ip_address" {
  type = bool
}

variable "instance" {

}
# variable "availability_zones" {
#   type = map(any)
# }

# variable "aws_security_group" {
#   type = string
# }

# variable "vpc_id" {

# }
# variable "subnet_id" {

# }



variable "load_balancer_type" {
  type = string
}

variable "internal" {
  type = bool
}
variable "name" {
  type = string
}
# variable "subnets" {

# }
