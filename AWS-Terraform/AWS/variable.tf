# variable "my_vpc_id" {
#     type = string
# }

variable "IPv4_CIDR" {
    type = string
}

variable "instance_tenancy" {
    type = string
}

variable "first_subnet_cidr" {
    type = string
}   

variable "second_subnet_cidr" {
    type = string
}

variable "third_subnet_cidr"{
    type = string
}
variable "tag" {
  type = map(any)
}

# variable "ami" {
#     type = string
# }

variable "instance_type" {
    type = string
}