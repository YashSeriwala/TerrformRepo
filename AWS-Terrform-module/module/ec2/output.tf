# output "sg_id" {
#   value = data.aws_security_group.default.id
# }
output "sg_id" {
  value = aws_security_group.test_sg.id
}