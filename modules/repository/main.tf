resource "github_repository" "this" {
  name         = var.name
  description  = var.description

  visibility         = var.visibility
  archived           = var.archived
  archive_on_destroy = var.archive_on_destroy

  auto_init          = try(var.template.init_readme, true)


  has_issues   = contains(var.features, "ISSUES")
  has_projects = contains(var.features, "PROJECTS")
  has_wiki     = contains(var.features, "WIKI")

  allow_merge_commit = contains(var.merge_strategies, "MERGE_COMMIT")
  allow_squash_merge = contains(var.merge_strategies, "SQUASH")
  allow_rebase_merge = contains(var.merge_strategies, "REBASE")

  delete_branch_on_merge = var.delete_branch_on_merge
  vulnerability_alerts   = var.vulnerability_alerts

}