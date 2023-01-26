variable "teams" {
  default = {
    example_team = {
      name = "example_team"
      members = {
        "example_user" = {
          username = "example_user"
          role = "member"
        },
        "example_user_1" = {
          username = "example_user_1"
          role = "maintainer"
        },
        "example_user_2" = {
          username = "example_user_2"
          role = "maintainer"
        }
      }
    },
  }
}