resource "aws_instance" "ec2_module" {
  instance_type = var.instance_type
  ami           = var.ami
  subnet_id = var.subnet_id
  availability_zone = var.availability_zone
  tags = {
    Name = "instance using module"
  }
}