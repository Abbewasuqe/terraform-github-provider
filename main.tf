locals {
  repository_groups = [
  var.repositories_example_one,
  var.repositories_two_example,
  var.repositories_three_example]

  repositories_merged = flatten([
    for repository_group in local.repository_groups : [
      for key, repository in repository_group.repositories :
      merge(repository, {
        topics = setunion(
          try(repository_group.default_topics, []),
          try(repository.topics, []),
        ),
        autolink_references = setunion(
          try(repository_group.default_autolink_references, []),
          try(repository.autolink_references, []),
        ),
        branch_protection = merge(
          try(repository_group.default_branch_protections, {}),
          try(repository.branch_protections, {}),
        ),
        resource_name = key
      })
    ]
  ])
  repositories = { for repo in local.repositories_merged :
    repo.resource_name => repo
  }
 }

module "repository" {
  for_each = local.repositories
  source = "./modules/repository"
  name = try(each.value.name, "test")
  description = try(each.value.description, "")
  default_branch = try(each.value.default_branch, "")
  archive_on_destroy = try(each.value.archive_on_destroy, true)
  delete_branch_on_merge = try(each.value.delete_branch_on_merge, false)
  visibility = try(each.value.visibility, "public")
  topics = try(each.value.topics, [])
  autolink_references = each.value.autolink_references
  branch_protection = try(each.value.branch_protection, {})
}
