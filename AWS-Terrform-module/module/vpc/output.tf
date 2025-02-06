# output "public_subnet" {
#   value = module.vpc.public_subnet_id
# }4

output "subnet_id" {
  value = aws_subnet.public_subnet
}

# output "subnet_id1"{
#   value = aws_subnet.private_subnet.id
# }