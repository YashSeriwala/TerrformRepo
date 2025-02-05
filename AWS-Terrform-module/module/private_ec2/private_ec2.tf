resource "aws_instance" "ec2"{
    instance_type = var.instance_type[count.index]
    subnet_id = var.subnet_id
    ami = var.ami
}