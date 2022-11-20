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
  default     = "private"
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
  default     = ["MERGE_COMMIT"]

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
  default     = "main"
}

variable "vulnerability_alerts" {
  description = "(Optional) Set to true to enable security alerts for vulnerable dependencies. Enabling requires alerts to be enabled on the owner level. GitHub enables the alerts on public repos but disables them on private repos by default."
  type        = bool
  default     = false
}
