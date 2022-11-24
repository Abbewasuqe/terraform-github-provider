provider "github" {
  owner = "abbe-org"
  token = "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"
}
terraform {
  required_providers {
    github = {
      version = "~> 4.6"
    }
  }
}
