variable "repositories_two_example" {
  default = {
    branch_protections = {
    "main" = {
      required_linear_history = true
    }
    "master" = {
      required_linear_history = true
    }
    }
    default_autolink_references = []
    repositories = {
      three = {
        name = "three"
        description = "Third repo"
        default_branch = "main"
      }
      four = {
        name = "four"
        description = "fourth repo"
        default_branch = "master"
      }
    }
  }
}
