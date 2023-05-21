# Terraform & Terragrunt project

This repository contains the code for managing infrastructure in AWS and GCP using Terraform and Terragrunt.

## Project Structure

This project is divided into two main directories:

- `infrastructure-modules`: This is where the Terraform modules live. Each module is responsible for creating a specific resource in either AWS or GCP.

- `infrastructure-live`: This is where the Terragrunt configurations live. Each configuration applies a Terraform module with specific inputs to create resources in an environment (dev, prod).

## Prerequisites

1. Install Terraform. Instructions can be found [here](https://learn.hashicorp.com/tutorials/terraform/install-cli).

2. Install Terragrunt. Instructions can be found [here](https://terragrunt.gruntwork.io/docs/getting-started/install/).

3. Configure your AWS and GCP credentials. AWS instructions can be found [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html). GCP instructions can be found [here](https://cloud.google.com/docs/authentication/getting-started).

## Usage

Navigate to any of the directories in `infrastructure-live` and run Terragrunt commands. For example, to deploy the `s3` module in the `dev` environment, you would:

```bash
cd infrastructure-live/dev/aws/s3
terragrunt apply
```

To clean up after yourself, you can run:

```bash
terragrunt destroy
```

To run a full plan for all modules in a environment, you can run:

```bash
# Enable locking to prevent concurrent runs. 
terragrunt run-all plan -lock=true --terragrunt-working-dir dev
```

## Customizing modules

Each module has a `variables.tf` file that lists all the inputs that can be customized. You can customize each module by editing the inputs block in the respective terragrunt.hcl file.

For example, to customize the `s3` module in the `dev` environment, you would edit the `inputs` block in `infrastructure-live/dev/aws/s3/terragrunt.hcl`.

## Further Information

For more detailed information about the modules, please refer to the README in each module directory.

For more information on how to use Terraform and Terragrunt, please refer to the following resources:

- [Terraform documentation](https://www.terraform.io/docs/index.html)
- [Terragrunt documentation](https://terragrunt.gruntwork.io/docs/)
- [Terragrunt best practices](https://terragrunt.gruntwork.io/docs/getting-started/best-practices/)
