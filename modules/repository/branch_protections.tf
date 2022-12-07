# resource "github_branch_protection" "protected" {
#   #for_each = var.branch_protections
#   pattern                         = github_repository.this.default_branch
#   repository_id                   = github_repository.this.node_id
#   #enforce_admins                  = var.enforce_admins
#   require_conversation_resolution = var.require_conversation_resolution
#   require_signed_commits          = var.require_signed_commits
#   #required_linear_history         = var.required_linear_history
# }

# resource "github_branch_protection" "this" {
#   count = length(var.branch_protections)

#   repository_id          = github_repository.this.node_id
#   pattern                = var.branch_protections[count.index].pattern
#   enforce_admins         = var.branch_protections[count.index].enforce_admins
#   require_signed_commits = var.branch_protections[count.index].require_signed_commits
#   required_linear_history = var.branch_protections[count.index].required_linear_history

#   required_status_checks {
#     strict   = lookup(lookup(var.branch_protections[count.index], "required_status_checks", null), "strict", null)
#     contexts = lookup(lookup(var.branch_protections[count.index], "required_status_checks", null), "contexts", null)
#   }

  # required_pull_request_reviews {
  #   dismiss_stale_reviews           = lookup(lookup(var.branch_protections[count.index], "required_pull_request_reviews", null), "dismiss_stale_reviews", null)
    #dismissal_users                 = lookup(lookup(var.branch_protections[count.index], "required_pull_request_reviews", null), "dismissal_users", null)
    #dismissal_teams                 = lookup(lookup(var.branch_protections[count.index], "required_pull_request_reviews", null), "dismissal_teams", null)
  #   require_code_owner_reviews      = lookup(lookup(var.branch_protections[count.index], "required_pull_request_reviews", null), "require_code_owner_reviews", null)
  #   required_approving_review_count = lookup(lookup(var.branch_protections[count.index], "required_pull_request_reviews", null), "required_approving_review_count", null)
  # }

  # restrictions {
  #   users = lookup(lookup(var.branch_protections[count.index], "restrictions", null), "users", null)
  #   teams = lookup(lookup(var.branch_protections[count.index], "restrictions", null), "teams", null)
  # }
#}


resource "github_branch_protection" "this" {
  for_each = local.rendered_branch_protection

  repository_id = github_repository.this.node_id
  pattern       = each.key == "default" ? github_repository.this.default_branch : each.key

  enforce_admins                  = each.value["enforce_admins"]
  allows_deletions                = each.value["allows_deletions"]
  allows_force_pushes             = each.value["allows_force_pushes"]
  require_signed_commits          = each.value["require_signed_commits"]
  required_linear_history         = each.value["required_linear_history"]
  require_conversation_resolution = each.value["require_conversation_resolution"]
  push_restrictions               = each.value["push_restrictions"]

  dynamic "required_status_checks" {
    for_each = each.value["required_status_enabled"] ? [each.value["required_status_checks"]] : []
    iterator = checks
    content {
      strict   = checks.value["strict"]
      contexts = checks.value["contexts"]
    }
  }

  dynamic "required_pull_request_reviews" {
    for_each = each.value["required_pull_request_enabled"] ? [each.value["required_pull_request_reviews"]] : []
    iterator = reviews
    content {
      dismiss_stale_reviews           = reviews.value["dismiss_stale_reviews"]
      restrict_dismissals             = reviews.value["restrict_dismissals"]
      dismissal_restrictions          = reviews.value["dismissal_restrictions"]
      require_code_owner_reviews      = reviews.value["require_code_owner_reviews"]
      required_approving_review_count = reviews.value["required_approving_review_count"]
    }
  }
}