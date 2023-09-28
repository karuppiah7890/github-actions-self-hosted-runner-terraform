provider "github" {
    owner = "TogaiHQ"
}

module "service_repo_secrets" {
    source = "./modules/runner-manager-secrets"
    for_each = toset( ["ingestion", "core-service", "invoice-service",
                       "event-processor", "marketplace-service",
                       "solutions-service", "openapi-specs"] )

    repository = each.value
    runner_manager_aws_access_key_id = data.terraform_remote_state.self_hosted_runner.outputs.manager_user_access_key_id
    runner_manager_aws_secret_access_key = data.terraform_remote_state.self_hosted_runner.outputs.manager_user_secret_key
    runner_manager_security_group_id = data.terraform_remote_state.self_hosted_runner.outputs.manager_security_group_id
    runner_manager_subnet_id = data.terraform_remote_state.self_hosted_runner.outputs.manager_public_subnet_id
    runner_manager_github_token = var.runner_manager_github_token
    runner_manager_aws_region = var.runner_manager_aws_region
}
