module "vpc" {
  source             = "./module/vpc"
  instance_tenancy   = var.instance_tenancy
  cidr_block         = var.cidr_block
  public_subnet_cidr =  var.public_subnet_cidr
  private_cidr_block = var.private_cidr_block
  # for_each = toset(data.aws_availability_zones.available.names)
    

}

# module "ec2_module" {
#   source            = "./module/ec2"
#   ami               = var.ami
#   instance_type     = var.instance_type
#   subnet_id         = module.vpc.subnet_id[count.]
#   availability_zone = var.availability_zone
# }

# module "ec2_module1" {
#   source        = "./module/private_ec2"
#   ami           = var.ami
#   instance_type = var.instance_type
#   subnet_id     = module.vpc.subnet_id1
# }

