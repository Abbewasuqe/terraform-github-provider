variable "repositories_two_example" {
  default = {
    default_branch_protections = [
    {
      pattern = "main"
      required_linear_history = true
    },
    {
      pattern = "master"
      required_linear_history = true
    }
    ]
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
