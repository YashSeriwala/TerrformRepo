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
  type = list(string)
}

