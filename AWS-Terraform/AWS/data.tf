# data "aws_ami_ids" "ubuntu" {
#   owners = ["amazon"]

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/ubuntu-*-*-amd64-server-*"]
#   }
# }

# data "aws_ami" "ubuntu" {
#   executable_users = ["self"]
#   most_recent      = true
# #   name_regex       = "^myami-[0-9]{3}"
#   owners           = ["amazon"]
#   filter {
#     name   = "name"
#     values = ["ubuntu/images/ubuntu-*-*-amd64-server-*"]
#   }
# }

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["amazon"] # Canonical's AWS account ID for official Ubuntu AMIs

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-amd64-server-*"]
  }
  tags = {
    Name = "new"
  }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
}




output "ami_id1" {
    value = data.aws_ami.ubuntu.id
}