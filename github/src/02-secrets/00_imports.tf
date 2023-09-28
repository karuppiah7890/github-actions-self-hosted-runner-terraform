variable "runner_manager_github_token" {
  type = string
}

variable "runner_manager_aws_region" {
  type = string
}

data "terraform_remote_state" "self_hosted_runner" {
  backend = "local"

  config = {
    path = "/terraform-states/github/01-self-hosted-runner.tfstate"
  }
}
