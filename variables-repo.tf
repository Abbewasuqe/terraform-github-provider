variable "reposs" {
  default = {
    susu ={
      name = "susu"
      description = "kakaka"
      default_branch = "main"
      branches = [
        "denilson"
      ]
      }
    fira ={
      name = "fira"
      description = "fira"
      default_branch = "main"
      branch_protection = {
        main = {
          enforce_admins = true
          required_linear_history = true
        }
      }
      }
    kuku ={
      name = "kuku"
      description = "kuku"
      default_branch = "main"
      branch_protection = {
        main = {
          enforce_admins = true
          required_linear_history = true
          allows_deletions = true
        }
      }
    }
  }
}


# variable "reposs" {
#   type = map(object({
#     name = string
#     description = string
#     branch_protection = object({
#       required_status_checks = object({
#         contexts = list(string)
#       })
#       required_pull_request_reviews = object({
#         dismiss_stale_reviews = bool
#         require_code_owner_reviews = bool
#       })
#       enforce_admins = optional(bool)
#       restrictions = object({
#         teams = list(string)
#         users = list(string)
#       })
#     })
#     default_branch = string
#   }))
#   default = {}
# }

