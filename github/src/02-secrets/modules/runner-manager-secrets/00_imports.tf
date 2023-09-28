terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }
  }
}

variable "repository" {
  type = string
}

variable "runner_manager_github_token" {
  type = string
}

variable "runner_manager_aws_region" {
  type = string
}

variable "runner_manager_aws_access_key_id" {
  type = string
}

variable "runner_manager_aws_secret_access_key" {
  type = string
}

variable "runner_manager_security_group_id" {
  type = string
}

variable "runner_manager_subnet_id" {
  type = string
}
