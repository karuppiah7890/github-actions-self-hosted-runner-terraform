# github

This is to maintain and manage things on GitHub - GitHub Secrets management, GitHub Self Hosted Runners Infrastructure and related things, required for a Self Hosted GitHub Actions Runner Setup with infrastructure and resources on AWS

## Setup

Create `configs.env` by checking out `configs.env.sample` and putting in the right values

```bash
cp github/configs.env.sample github/configs.env
```

The `GITHUB_TOKEN` in `configs.env` should be a personal access token (PAT) (classic) and should have the following access -

- `repo` - all of `repo:status`, `repo_deployment`, `public_repo`, `repo:invite`, `security_events`
- The user creating the token should have `Admin` access to any of the GitHub private (or public) repositories whose secrets have to be managed. `Admin` access can be given by going to the repository's `Settings`` > `Collaborators and teams` > `Manage Access`

The set of AWS credentials - `AWS_ACCESS_KEY` and `AWS_SECRET_KEY` - should have access to create all the resources mentioned in the Terraform source code files with appropriate level of permission. For example, it should have access to create VPC, Internet Gateway, create subnet, create route table, create security group, create IAM user, create IAM policy, attach IAM policy to IAM user, also, all of them in appropriate regions for region specific resources

`TF_VAR_runner_image_id` should be the Amazon Machine Image (AMI) ID for the image to be used to create EC2 machines for the runner machines.

## Example workflow

You can find an example workflow under `.github/workflows`
