module "repository" {
  for_each                = var.reposs
  source                  = "./modules/repository"
  name                    = each.value.name
  description             = each.value.description
  branch_protection       = each.value.branch_protection
  branches                = each.value.branches
  default_branch = each.value.default_branch
}

