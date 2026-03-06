# Terraform Guide

Terraform manages infrastructure using code.

---

## Folder Structure

infrastructure/terraform/

main.tf
variables.tf
outputs.tf
provider.tf
terraform.tfvars

---

## Initialize Terraform

terraform init

---

## Preview Infrastructure

terraform plan

---

## Apply Infrastructure

terraform apply

---

## Destroy Infrastructure

terraform destroy

---

## Best Practices

Never commit:

terraform.tfvars

Never commit:

tfstate files

Always use remote state in production.
