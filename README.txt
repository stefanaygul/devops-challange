# Terraform Deployment

This guide provides instructions for manually deploying the Terraform configurations for the `dev`, `staging`, and `prod` environments.

## Environment Setup

1. Clone the repository:

   ```
   git clone https://github.com/stefanaygul/devops-challange.git
   cd devops-challange
   ```

2. ```
    cd <env> like dev/
    terraform init
    terraform plan -var-file="dev.tfvars" -out=dev-plan.out
    terraform apply "dev-plan.out"
    ```