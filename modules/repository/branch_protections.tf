resource "github_branch_protection" "this" {
  for_each = var.branch_protection

  repository_id = github_repository.this.node_id
  pattern       = each.key == "default" ? github_repository.this.default_branch : each.key

  enforce_admins                  = each.value["enforce_admins"]
  allows_deletions                = each.value["allows_deletions"]
  allows_force_pushes             = each.value["allows_force_pushes"]
  require_signed_commits          = each.value["require_signed_commits"]
  required_linear_history         = each.value["required_linear_history"]
  require_conversation_resolution = each.value["require_conversation_resolution"]

  dynamic "required_status_checks" {
    for_each = each.value.required_status_checks == null ? [] : [each.value.required_status_checks]

    content {
      strict   = required_status_checks.value.strict
      contexts = required_status_checks.value.contexts
    }
  }
}

