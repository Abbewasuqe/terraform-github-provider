variable "name" {
  description = "(Required) A name of the repository."
  type        = string
}

variable "description" {
  description = "(Optional) A description of the repository."
  type        = string
  default     = "Managed by Terraform."
}

variable "visibility" {
  description = "(Optional) Can be `public`, `private` or `internal`. `internal` visibility is only available if your organization is associated with an enterprise account using GitHub Enterprise Cloud or GitHub Enterprise Server 2.20+."
  type        = string
  default     = "public"
}

variable "is_template" {
  description = "(Optional) Set to `true` if this is a template repository."
  type        = bool
  default     = false
}

variable "archived" {
  description = "(Optional) Specify if the repository should be archived. Defaults to `false`. NOTE: Currently, the API does not support unarchiving."
  type        = bool
  default     = false
}

variable "archive_on_destroy" {
  description = "(Optional) Set to `true` to archive the repository instead of deleting on destroy."
  type        = bool
  default     = false
}

variable "template" {
  description = <<EOF
  (Optional) Use a template repository, license or gitignore to create the repository.this resource. `template` block as defined below.
    (Optional) `gitignore` - Choose which files not to track from a list of templates. Use the name of the template without the extension. For example, `Haskell`.
    (Optional) `init_readme` - Set to `true` to produce an initial commit with README.md in the repository.
    (Optional) `license` - A license tells others what they can and can't do with your code. Use the name of the license template without the extension. For example, `mit` or `mpl-2.0`.
    (Optional) `repository` - Start this repository with a template repository's contents. The full name of the repository is required. A string of the form `owner/repository`.
  EOF
  type        = any
  default     = {}
}


variable "features" {
  description = "(Optional) A list of enabled features on the repository. Available features: `ISSUES`, `PROJECTS`, `WIKI`."
  type        = set(string)
  default     = ["ISSUES", "PROJECTS", "WIKI"]

  validation {
    condition = alltrue([
      for feature in var.features :
      contains(["ISSUES", "PROJECTS", "WIKI"], feature)
    ])
    error_message = "Available features: `ISSUES`, `PROJECTS`, `WIKI`."
  }
}

variable "merge_strategies" {
  description = "(Optional) A list of allowed strategies for merging pull requests on the repository. Available strategies: `MERGE_COMMIT`, `SQUASH`, `REBASE`."
  type        = set(string)
  default     = ["MERGE_COMMIT","SQUASH" ]

  validation {
    condition = alltrue([
      for strategy in var.merge_strategies :
      contains(["MERGE_COMMIT", "SQUASH", "REBASE"], strategy)
    ])
    error_message = "Available strategies: `MERGE_COMMIT`, `SQUASH`, `REBASE`."
  }
}

variable "delete_branch_on_merge" {
  description = "(Optional) Automatically delete head branch after a pull request is merged. Defaults to true."
  type        = bool
  default     = false
}

variable "topics" {
  description = "(Optional) A list of topics for the repository."
  type        = set(string)
  default     = []
}


variable "read_teams" {
  description = "(Optional) A list of teams with `read` permission to the repository. You can use GitHub team id or the GitHub team slug."
  type        = set(string)
  default     = []
}

variable "triage_teams" {
  description = "(Optional) A list of teams with `triage` permission to the repository. You can use GitHub team id or the GitHub team slug."
  type        = set(string)
  default     = []
}

variable "write_teams" {
  description = "(Optional) A list of teams with `write` permission to the repository. You can use GitHub team id or the GitHub team slug."
  type        = set(string)
  default     = []
}

variable "maintain_teams" {
  description = "(Optional) A list of teams with `maintain` permission to the repository. You can use GitHub team id or the GitHub team slug."
  type        = set(string)
  default     = []
}

variable "admin_teams" {
  description = "(Optional) A list of teams with `admin` permission to the repository. You can use GitHub team id or the GitHub team slug."
  type        = set(string)
  default     = []
}

variable "read_collaborators" {
  description = "(Optional) A list of users as collaborator with `read` permission to the repository. You can use GitHub username."
  type        = set(string)
  default     = []
}

variable "triage_collaborators" {
  description = "(Optional) A list of users as collaborator with `triage` permission to the repository. You can use GitHub username."
  type        = set(string)
  default     = []
}

variable "write_collaborators" {
  description = "(Optional) A list of users as collaborator with `write` permission to the repository. You can use GitHub username."
  type        = set(string)
  default     = []
}

variable "maintain_collaborators" {
  description = "(Optional) A list of users as collaborator with `maintain` permission to the repository. You can use GitHub username."
  type        = set(string)
  default     = []
}

variable "admin_collaborators" {
  description = "(Optional) A list of users as collaborator with `admin` permission to the repository. You can use GitHub username."
  type        = set(string)
  default     = []
}

variable "branches" {
  description = "(Optional) A list of branches to create and manage within the repository."
  type        = set(string)
  default     = []
}

variable "default_branch" {
  description = "(Optional) Set the default branch for the repository. Default is `main` branch."
  type        = string
  #default     = []
}

variable "vulnerability_alerts" {
  description = "(Optional) Set to true to enable security alerts for vulnerable dependencies. Enabling requires alerts to be enabled on the owner level. GitHub enables the alerts on public repos but disables them on private repos by default."
  type        = bool
  default     = false
}

# Branch Protections

variable "dismiss_review_users" {
  type        = list(string)
  default     = []
  description = "the users which is granted the access to dismiss review on the protected branch"
}

#variable "enforce_admins" {
#   type        = bool
#   default     = false
#   description = "whether the admin should be enforced to follow the branch protection rule or not"
# }

variable "force_pr_rebase" {
  type        = string
  default     = null
  description = "whether PR should have up-to-date base branch (e.g. rebased) before they're merged"
}

variable "status_checks_contexts" {
  type        = list(string)
  default     = []
  description = "The list of required status checks in order to merge into the protected branch, e.g. AWS CodeBuild ap-southeast-1 (<codebuild_project_name>)"
}

variable "require_conversation_resolution" {
  default     = false
  description = "Boolean, setting this to true requires all conversations on code must be resolved before a pull request can be merged."
}

variable "require_signed_commits" {
  default     = false
  description = "Boolean, setting this to true requires all commits to be signed with GPG."
}

# variable "branch_protections" {
#   type = list(object({
#     pattern                 = string,
#     enforce_admins         = optional(bool),
#     require_signed_commits = optional(bool),
#     required_linear_history = optional(bool),
#     required_status_checks = object({
#       strict   = bool
#       contexts = list(string)
#     })

#     required_pull_request_reviews = object({
#       dismiss_stale_reviews           = optional(bool),
#       #dismissal_users                 = list(string),
#       #dismissal_teams                 = list(string),
#       require_code_owner_reviews      = bool,
#       required_approving_review_count = number // NOTE: this must be 6 or less
#     })

#     # restrictions = object({
#     #   users = list(string),
#     #   teams = list(string)
#     # })
#    }))

#   description = "List of Branch Protection Objects"
#   default     = []
# }



variable "default_branch_protection_enabled" {
  type        = bool
  default     = false
  description = "Set to `false` if you want to disable branch protection for default branch"
}

variable "default_branch_protection" {
  type = object({
    enforce_admins                  = optional(bool)
    allows_deletions                = optional(bool)
    allows_force_pushes             = optional(bool)
    require_signed_commits          = optional(bool)
    required_linear_history         = optional(bool)
    require_conversation_resolution = optional(bool)
    push_restrictions               = optional(list(string))
    required_status_enabled         = optional(bool)
    required_status_checks = optional(object({
      strict   = optional(bool)
      contexts = optional(list(string))
    }))
    required_pull_request_enabled = optional(bool)
    required_pull_request_reviews = optional(object({
      dismiss_stale_reviews           = optional(bool)
      restrict_dismissals             = optional(bool)
      dismissal_restrictions          = optional(list(string))
      require_code_owner_reviews      = optional(bool)
      required_approving_review_count = optional(number)
    }))
  })
  default     = {} # See defaults in locals.tf
  description = "Default branch protection settings."
}

variable "branch_protection" {
  type = map(object({
    enforce_admins                  = optional(bool)
    allows_deletions                = optional(bool)
    allows_force_pushes             = optional(bool)
    require_signed_commits          = optional(bool)
    required_linear_history         = optional(bool)
    require_conversation_resolution = optional(bool)
    push_restrictions               = optional(list(string))
    required_status_enabled         = optional(bool)
    required_status_checks = optional(object({
      strict   = optional(bool)
      contexts = optional(list(string))
    }))
    required_pull_request_enabled = optional(bool)
    required_pull_request_reviews = optional(object({
      dismiss_stale_reviews           = optional(bool)
      restrict_dismissals             = optional(bool)
      dismissal_restrictions          = optional(list(string))
      require_code_owner_reviews      = optional(bool)
      required_approving_review_count = optional(number)
    }))
  }))
  default     = null # See defaults in locals.tf
  description = "Branch protection settings. Use to set protection rules for branches different to default branch."
}
