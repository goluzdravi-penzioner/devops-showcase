# Incode test

Incode take home test assigment: Kubernetes resources

## Table of Contents

- [Requirements](#Requirements)
- [Installation](#installation)
- [Usage](#usage)
- [CI/CD](#CI/CD)

## Requirements

- terraform
- aws-cli

## Installation

To install this project, follow these steps:

1. Clone the repository:

2. Navigate to the project directory:
    ```sh
    cd incode/terraform/aws/
    ```

3. To run terraform locally:
   - before running any terraform its required to setup AWS profile with enough privileges to crate all resources.

     It can be done via config file `(~/.aws/credentials)`:
   
     

    ```
    [default]
    aws_access_key_id = YOUR_DEFAULT_ACCESS_KEY_ID
    aws_secret_access_key = YOUR_DEFAULT_SECRET_ACCESS_KEY
    ```

    or env vars:

      ```
      export AWS_ACCESS_KEY_ID=your-access-key-id
      export AWS_SECRET_ACCESS_KEY=your-secret-access-key
      export AWS_SESSION_TOKEN=your-session-token  # Omit if not using temporary credentials
      export AWS_DEFAULT_REGION=us-west-2
      export AWS_DEFAULT_OUTPUT=json
      ```

## Usage

1. navigate to `incode/terraform/aws/`
2. Initialise terraform amd validate:

   ```
   terraform init
   terraform validate
   ```
3. To deploy the tf code:
   ```
   terraform plan --var-file env/terraform.tfvars
   terraform apply --var-file env/terraform.tfvars
   ```
## CI/CD

- CI/CD is implemented with github actions (GHA)
- Make changes in the code, commit and push to the remote (main branch)
- After commit/merge to main branch, GHA will do the terraform init, validate, plan and apply