resource "aws_security_group" "github_actions_self_hosted_runner" {
  name = "github-actions-self-hosted-runner"
  description = "Allows HTTPS access to the Public Internet for GitHub Actions Runner software to contact GitHub APIs and also allow SSH access to SSH into GitHub servers to access git repositories. Allow access to any IPv4 IP, any protocol, all traffic, on any port"
  vpc_id = aws_vpc.github_actions_self_hosted_runner.id

  tags = {
    Name = "github-actions-self-hosted-runner"
  }
}

resource "aws_vpc_security_group_egress_rule" "github_actions_self_hosted_runner_outbound_rule" {
  security_group_id = aws_security_group.github_actions_self_hosted_runner.id
  cidr_ipv4   = "0.0.0.0/0"

  description = "Outbound traffic to public Internet to access any port of any resource through any protocol. This is especially to connect to GitHub APIs, to be able to pull HTTP and HTTPS based resources, SSH into github to work with git repositories, and other things"
  ip_protocol = "all" # all protocols, all port ranges
}

output "manager_security_group_id" {
  value = aws_security_group.github_actions_self_hosted_runner.id
}
