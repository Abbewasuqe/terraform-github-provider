module "repository" {
  for_each                = var.reposs
  source                  = "./modules/repository"
  name                    = each.value.name
  description             = each.value.description
  branches                = try(each.value.branches, [])
  default_branch          = each.value.default_branch
  branch_protection       = try(each.value.branch_protection, {})
}
#each.value.branch_protection != null ? each.value.branch_protection : null