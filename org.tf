variable "org" {
  default = {
    members = {
      "example_user" = {
        username = "example_user"
        role     = "admin"
      },
      "example_user_2" = {
        username = "example_user_2"
        role     = "member"
      }
    }
  }
}
