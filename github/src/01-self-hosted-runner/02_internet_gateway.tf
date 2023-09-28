# Create - Internet Gateway
resource "aws_internet_gateway" "github_actions_self_hosted_runner" {
  vpc_id = aws_vpc.github_actions_self_hosted_runner.id

  tags = {
    Name = "github-actions-self-hosted-runner"
  }
}
