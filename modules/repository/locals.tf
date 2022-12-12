# locals {
#     # These settings are default for branch protection
#   default = {}
#   branch_protection_defaults = {
#     enforce_admins                  = true
#     allows_deletions                = false
#     allows_force_pushes             = false
#     require_signed_commits          = true
#     required_linear_history         = true
#     require_conversation_resolution = false
#     push_restrictions               = []
#     required_status_enabled         = false
#     required_status_checks = {
#       strict   = false
#       contexts = []
#     }
#     required_pull_request_enabled = false
#     required_pull_request_reviews = {
#       dismiss_stale_reviews           = false
#       restrict_dismissals             = false
#       dismissal_restrictions          = []
#       require_code_owner_reviews      = false
#       required_approving_review_count = 0
#     }
#   }
#   # Combine defaults with input parameters
#   # TODO: refactor if `deepmerge` is implemented https://github.com/hashicorp/terraform/issues/31815
#   # When you use `optional()` parameters all keys are defined and values are set to `null`.
#   # In this case `lookup` all the time return `null` when you reference the key.
#   # You have to use `if .. else` condition to sort it out.
#    clean_default_branch_protection = {
#      for k, v in var.default_branch_protection :
#      k => (v != null ? v : local.branch_protection_defaults[k])
#    }
#    clean_branch_protection = var.branch_protection != null ? {
#      for name, settings in var.branch_protection :
#      name => {
#        for k, v in settings :
#        k => (v != null ? v : local.branch_protection_defaults[k])
#      }
#    } : {}
#   rendered_branch_protection = merge(
#     # Branch protection rules for default branch
#     var.default_branch_protection_enabled ? {
#       default = {
#         enforce_admins                  = local.clean_default_branch_protection["enforce_admins"]
#         allows_deletions                = local.clean_default_branch_protection["allows_deletions"]
#         allows_force_pushes             = local.clean_default_branch_protection["allows_force_pushes"]
#         require_signed_commits          = local.clean_default_branch_protection["require_signed_commits"]
#         required_linear_history         = local.clean_default_branch_protection["required_linear_history"]
#         require_conversation_resolution = local.clean_default_branch_protection["require_conversation_resolution"]
#         push_restrictions               = local.clean_default_branch_protection["push_restrictions"]
#         required_status_enabled         = local.clean_default_branch_protection["required_status_enabled"]
#          required_status_checks = {
#            for k, v in local.clean_default_branch_protection["required_status_checks"] :
#            k => (v != null ? v : local.branch_protection_defaults["required_status_checks"][k])
#          }
#          required_pull_request_enabled = local.clean_default_branch_protection["required_pull_request_enabled"]
#          required_pull_request_reviews = {
#            for k, v in local.clean_default_branch_protection["required_pull_request_reviews"] :
#            k => (v != null ? v : local.branch_protection_defaults["required_pull_request_reviews"][k])
#          }
#       }
#     } : {},
#     # Additional branch protection rules
#     var.branch_protection != null ? {
#       for name, settings in var.branch_protection :
#       name => {
#         enforce_admins                  = local.clean_branch_protection[name]["enforce_admins"]
#         allows_deletions                = local.clean_branch_protection[name]["allows_deletions"]
#         allows_force_pushes             = local.clean_branch_protection[name]["allows_force_pushes"]
#         require_signed_commits          = local.clean_branch_protection[name]["require_signed_commits"]
#         required_linear_history         = local.clean_branch_protection[name]["required_linear_history"]
#         require_conversation_resolution = local.clean_branch_protection[name]["require_conversation_resolution"]
#         push_restrictions               = local.clean_branch_protection[name]["push_restrictions"]
#         required_status_enabled         = local.clean_branch_protection[name]["required_status_enabled"]
#         required_status_checks = {
#           for k, v in local.clean_branch_protection[name]["required_status_checks"] :
#           k => (v != null ? v : local.branch_protection_defaults["required_status_checks"][k])
#         }
#         required_pull_request_enabled = local.clean_branch_protection[name]["required_pull_request_enabled"]
#         required_pull_request_reviews = {
#           for k, v in local.clean_branch_protection[name]["required_pull_request_reviews"] :
#           k => (v != null ? v : local.branch_protection_defaults["required_pull_request_reviews"][k])
#         }
#       }
#     } : {}
#   )
# }
