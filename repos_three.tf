variable "repositories_three_example" {
  default = {
    branch_protections = {
    "main" = {
      required_linear_history = true
    }
    "master" = {
      required_linear_history = true
    }
    }
    repositories = {
      five = {
        name = "five"
        description = "fifth repo"
        default_branch = "main"
      }
      six = {
        name = "six"
        description = "sixth repo"
        default_branch = "master"
      }
    }
  }
}


