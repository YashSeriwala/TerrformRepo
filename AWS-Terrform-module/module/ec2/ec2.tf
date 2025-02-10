resource "aws_instance" "ec2_module" {
  instance_type = var.instance_type
  ami           = var.ami
  subnet_id = var.subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  # security_groups = data.aws_security_groups.default_sg.ids
  //availability_zone = var.availability_zone
  security_groups = [aws_security_group.test_sg.id]
  tags = {
    Name = "instance using module"
  }
}