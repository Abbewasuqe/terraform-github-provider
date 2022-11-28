resource "github_branch_protection" "protected" {
  pattern                         = github_repository.this.default_branch
  repository_id                   = github_repository.this.node_id
  enforce_admins                  = var.enforce_admins
  require_conversation_resolution = var.require_conversation_resolution
  require_signed_commits          = var.require_signed_commits
  required_linear_history         = var.required_linear_history
}