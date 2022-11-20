provider "github" {
}

terraform {
  required_providers {
    github = {
      version = "~> 4.6"
    }
  }
}
