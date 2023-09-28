# Create and configure IAM  User which will create and/ terminate EC2 instances
resource "aws_iam_user" "manager" {
  name = "self-hosted-github-actions-runner-manager"
}

resource "aws_iam_access_key" "iam_access_key" {
  user = aws_iam_user.manager.name
}

resource "aws_iam_policy" "manager_policy" {
  name        = "self-hosted-github-actions-runner-manager"
  description = "A policy when attached to an IAM user, the user will be able to manage (create and terminate) EC2 instances in the given AWS region, to manage (create and terminate) self hosted GitHub Action runners"
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "RunInstancesAccess",
            "Effect": "Allow",
            "Action": [
                "ec2:RunInstances"
            ],
            "Resource": [
                "arn:aws:ec2:${var.aws_region}:${var.aws_account_id}:network-interface/*",
                "arn:aws:ec2:${var.aws_region}:${var.aws_account_id}:security-group/${aws_security_group.github_actions_self_hosted_runner.id}",
                "arn:aws:ec2:${var.aws_region}:${var.aws_account_id}:key-pair/*",
                "arn:aws:ec2:${var.aws_region}:${var.aws_account_id}:volume/*",
                "arn:aws:ec2:${var.aws_region}:${var.aws_account_id}:subnet/${module.self_hosted_runner_public_subnet.id}",
                "arn:aws:ec2:${var.aws_region}::image/${var.runner_image_id}",
                "arn:aws:ec2:${var.aws_region}:${var.aws_account_id}:instance/*"
            ]
        },
        {
            "Sid": "TerminateInstanceAccess",
            "Effect": "Allow",
            "Action": [
                "ec2:TerminateInstances"
            ],
            "Resource": [
                "arn:aws:ec2:${var.aws_region}:${var.aws_account_id}:instance/*"
            ]
        },
        {
            "Sid": "DescribeInstancesAccess",
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeInstances"
            ],
            "Resource": "*"
        },
        {
            "Sid": "TagInstancesAccess",
            "Effect": "Allow",
            "Action": [
                "ec2:CreateTags"
            ],
            "Resource": [
                "arn:aws:ec2:${var.aws_region}:${var.aws_account_id}:instance/*",
                "arn:aws:ec2:${var.aws_region}:${var.aws_account_id}:volume/*"
            ],
            "Condition": {
              "StringEquals": {
                "ec2:CreateAction": "RunInstances"
              }
            }
        }
    ]
}
  EOF
}

resource "aws_iam_user_policy_attachment" "manager_iam" {
  user       = aws_iam_user.manager.name
  policy_arn = aws_iam_policy.manager_policy.arn
}

########################

# Outputs
output "manager_user_arn" {
  value = aws_iam_user.manager.arn
}

output "manager_user_name" {
  value = aws_iam_user.manager.name
}

output "manager_user_access_key_id"  {
  value = aws_iam_access_key.iam_access_key.id
}

output "manager_user_secret_key"  {
  value = aws_iam_access_key.iam_access_key.secret
  sensitive = true
}
