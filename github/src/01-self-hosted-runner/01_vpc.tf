# Create - VPC
resource "aws_vpc" "github_actions_self_hosted_runner" {
  cidr_block = "${var.ip_prefix_2_octets}.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "github-actions-self-hosted-runner"
  }
}
