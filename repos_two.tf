variable "repositories_two_example" {
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
