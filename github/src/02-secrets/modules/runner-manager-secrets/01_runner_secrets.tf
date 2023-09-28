resource "github_actions_secret" "runner_manager_aws_access_key_id" {
    repository = var.repository
    secret_name = "RUNNER_MANAGER_AWS_ACCESS_KEY_ID"
    plaintext_value = var.runner_manager_aws_access_key_id
}

resource "github_actions_secret" "runner_manager_aws_secret_access_key" {
    repository = var.repository
    secret_name = "RUNNER_MANAGER_AWS_SECRET_ACCESS_KEY"
    plaintext_value = var.runner_manager_aws_secret_access_key
}

resource "github_actions_secret" "runner_manager_aws_region" {
    repository = var.repository
    secret_name = "RUNNER_MANAGER_AWS_REGION"
    plaintext_value = var.runner_manager_aws_region
}

resource "github_actions_secret" "runner_manager_gh_personal_access_token" {
    repository = var.repository
    secret_name = "RUNNER_MANAGER_GH_PERSONAL_ACCESS_TOKEN"
    plaintext_value = var.runner_manager_github_token
}

resource "github_actions_secret" "runner_manager_security_group_id" {
    repository = var.repository
    secret_name = "RUNNER_MANAGER_SECURITY_GROUP_ID"
    plaintext_value = var.runner_manager_security_group_id
}

resource "github_actions_secret" "runner_manager_subnet_id" {
    repository = var.repository
    secret_name = "RUNNER_MANAGER_SUBNET_ID"
    plaintext_value = var.runner_manager_subnet_id
}
