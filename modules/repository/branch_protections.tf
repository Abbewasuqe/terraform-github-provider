resource "github_branch_protection" "one" {
  pattern = "main"
  repository_id = github_repository.this.node_id
  enforce_admins = var.enforce_admins
  depends_on = [github_branch.this]
  allows_deletions = var.allows_deletions
  allows_force_pushes = var.allows_deletions
}
