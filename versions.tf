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
