terraform {
  backend "s3" {
    bucket       = "hafez-codes-terraform-state"
    key          = "dev/terraform.tfstate"
    region       = "eu-central-1"
    encrypt      = true
    use_lockfile = true
  }
}
