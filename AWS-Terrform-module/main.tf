module "vpc" {
  source             = "./module/vpc"
  instance_tenancy   = var.instance_tenancy
  cidr_block         = var.cidr_block
  public_subnet_cidr = var.public_subnet_cidr
  private_cidr_block = var.private_cidr_block
  availability_zone  = var.availability_zone

}

# module "vpc" {
#   source             = "./module/vpc"
#   for_each = var.availability_zones
#   instance_tenancy   = var.instance_tenancy
#   cidr_block         = var.cidr_block
#   public_subnet_cidr =  each.value.public_subnet
#   private_cidr_block = each.value.private_subnet
#   availability_zone = each.value.availability_zone

# }

module "ec2_module" {
  source                      = "./module/ec2"
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = module.vpc.subnet_id[0].id
  associate_public_ip_address = var.associate_public_ip_address
  vpc_id                      = module.vpc.vpc_id
}



