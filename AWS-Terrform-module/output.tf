# output "available_zones" {
#   value = data.aws_availability_zones.available.names
# }
output "sub_id" {
  value = module.vpc.subnet_id
}