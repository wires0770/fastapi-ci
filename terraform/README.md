# Terraform: local Docker infrastructure for FastAPI

Creates a Docker network and a container with the FastAPI image.

## Usage

```
docker build -t fastapi-ci:local .
cd terraform
Copy-Item terraform.tfvars.example terraform.tfvars
terraform init
terraform plan
terraform apply
terraform destroy
```

The image is built with `docker build`; Terraform reads it via a data source.
State (`*.tfstate`), plans and `terraform.tfvars` are not committed.
