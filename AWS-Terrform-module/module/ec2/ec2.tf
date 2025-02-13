resource "aws_instance" "ec2_module" {
  instance_type = var.instance_type
  ami           = var.ami
  subnet_id = var.subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  # security_groups = data.aws_security_groups.default_sg.ids
  //availability_zone = var.availability_zone
  security_groups = [aws_security_group.test_sg.id]
  # iam_instance_profile = aws_iam_instance_profile.ssm_instance_profile.name
  iam_instance_profile = data.aws_iam_role.ssm.name
  tags = {
    Name = "instance using module"
  }

user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y nginx
              systemctl start nginx
              systemctl enable nginx
              EOF

  # tags = {
  #   Name = "Nginx-EC2"
  # }
}