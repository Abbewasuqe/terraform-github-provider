# locals {
#   autolink_references = { for i in var.autolink_references : lookup(i, "id", lower(i.key_prefix)) => merge({
#     target_url_template = null
#   }, i) }
# }

# resource "github_repository_autolink_reference" "github_repository_autolink_reference" {
#   for_each = local.autolink_references

#   repository          = github_repository.this.name
#   key_prefix          = each.value.key_prefix
#   target_url_template = each.value.target_url_template
# }

resource "github_repository_autolink_reference" "github_repository_autolink_reference" {
  count = length(var.autolink_references)
  repository          = github_repository.this.name
  key_prefix          = var.autolink_references[count.index].key_prefix
  target_url_template = var.autolink_references[count.index].target_url_template
}
