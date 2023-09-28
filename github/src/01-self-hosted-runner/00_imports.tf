provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Feature = "Continuous Integration"
    }
  }
}

variable "aws_region" {
  type = string
}

variable "aws_account_id" {
  type = string
}

variable "ip_prefix_2_octets" {
  type = string
}

variable "runner_image_id" {
  type = string
}
