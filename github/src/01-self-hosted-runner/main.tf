terraform {
  backend "local" {
    path = "/terraform-states/github/01-self-hosted-runner.tfstate"
  }
}
