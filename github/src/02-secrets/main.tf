terraform {
  backend "local" {
    path = "/terraform-states/github/02-secrets.tfstate"
  }

  required_providers {
    github = {
      source = "integrations/github"
    }
  }
}
