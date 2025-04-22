# Terraform Infra Playground

This is a repository including a Terraform project that I'm creating just to actually start the foundation myself of an "enterprise" Terraform project.

## Roadmap
- [ ] Create a simple Terraform on a single account
- [ ] Use a Lambda that throws errors 70% of the time
- [ ] Test SQS with failure and DLQ
- [ ] Separate backend on a different AWS account
- [ ] Use Assume Role to access the Terraform backend
- [ ] Migrate Backend on shared environment
- [ ] Migrate Lambdas on shared environment

## Directory Structure
```
infra/
├── backend.tf
├── main.tf
├── variables.tf
```