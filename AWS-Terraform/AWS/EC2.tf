resource "aws_instance" "tf_ec2" {
    instance_type = var.instance_type
    ami = data.aws_ami.ubuntu.id
    subnet_id = aws_subnet.first-subnet.id
    availability_zone = "us-east-1a"
    # key_name = "demo-key"
    tags = {
      Name = "tf_ec2"
    }
}