variable "repositories_example_one" {
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
      one = {
        name = "one"
        description = "one"
        default_branch = "main"
      }
      nmp = {
        name = "two"
        description = "two"
        default_branch = "master"
        topics = ["example"]
        branch_protections = [
          {
            pattern = "main"
            required_linear_history = true
          },
          {
            pattern = "master"
            required_linear_history = true
          }
        ]
      }
    }
  }
}