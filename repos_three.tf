variable "repositories_three_example" {
  default = {
    default_branch_protections = {
      main = {
        enforce_admins = true
      },
      master = {
        enforce_admins = false
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


