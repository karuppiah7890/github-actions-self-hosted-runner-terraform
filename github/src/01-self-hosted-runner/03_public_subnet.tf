# Create Route Table
module "self_hosted_runner_public_subnet_route_table" {

  source = "../../../docker/modules/public-route-table"

  vpc_id = aws_vpc.github_actions_self_hosted_runner.id
  rt_name = "github-actions-self-hosted-runner-public-subnet"
  igw_id = aws_internet_gateway.github_actions_self_hosted_runner.id
}

module "self_hosted_runner_public_subnet" {
  source = "../../../docker/modules/subnet"

  vpc_id = aws_vpc.github_actions_self_hosted_runner.id
  subnet_name = "github-actions-self-hosted-runner-public-subnet"
  cidr_ipv4 = "${var.ip_prefix_2_octets}.1.0/24"
  rt_id = module.self_hosted_runner_public_subnet_route_table.id
}

output "manager_public_subnet_id" {
  value = module.self_hosted_runner_public_subnet.id
}
