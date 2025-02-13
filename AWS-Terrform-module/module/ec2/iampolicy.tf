# resource "aws_iam_policy" "ssm_policy" {
#   policy = jsonencode(
#     {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Effect": "Allow",
#             "Action": [
#                 "cloudwatch:PutMetricData",
#                 "ds:CreateComputer",
#                 "ds:DescribeDirectories",
#                 "ec2:DescribeInstanceStatus",
#                 "logs:*",
#                 "ssm:*",
#                 "ec2messages:*"
#             ],
#             "Resource": "*"
#         },
#         {
#             "Effect": "Allow",
#             "Action": "iam:CreateServiceLinkedRole",
#             "Resource": "arn:aws:iam::*:role/aws-service-role/ssm.amazonaws.com/AWSServiceRoleForAmazonSSM*",
#             "Condition": {
#                 "StringLike": {
#                     "iam:AWSServiceName": "ssm.amazonaws.com"
#                 }
#             }
#         },
#         {
#             "Effect": "Allow",
#             "Action": [
#                 "iam:DeleteServiceLinkedRole",
#                 "iam:GetServiceLinkedRoleDeletionStatus"
#             ],
#             "Resource": "arn:aws:iam::*:role/aws-service-role/ssm.amazonaws.com/AWSServiceRoleForAmazonSSM*"
#         },
#         {
#             "Effect": "Allow",
#             "Action": [
#                 "ssmmessages:CreateControlChannel",
#                 "ssmmessages:CreateDataChannel",
#                 "ssmmessages:OpenControlChannel",
#                 "ssmmessages:OpenDataChannel"
#             ],
#             "Resource": "*"
#         }
#     ]
# }

# )

# tags = {
#   Name = "SSM_Policy"
#   description = "Policy using terraform"
# }
# }

# # resource "aws_iam_instance_profile" "ssm_instance_profile" {
# #   name = "us"
# #   role = aws_iam_role.ssm_role.name
# # }

# resource "aws_iam_role" "ssm_role" {
#   assume_role_policy =  jsonencode( {   "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Effect": "Allow",
#             "Principal": {
#                 "Service": "ec2.amazonaws.com"
#             },
#             "Action": "sts:AssumeRole"
#         }
#     ]
# })
# }

# resource "aws_iam_policy_attachment" "ssm_policy" {
#   name = "test-attachment"
#   roles = [ aws_iam_role.ssm_role.name] 
#   policy_arn = aws_iam_policy.ssm_policy.arn
# }