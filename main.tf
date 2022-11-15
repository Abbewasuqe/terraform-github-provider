provider "github" {
  token = var.gh_token
}

resource "github_repository" "terra-created" {
    name = "new-terra"
    description = "awesom"

    private = false
    auto_init = true
    has_projects = true
    has_issues = true
}

resource "github_branch_protection" "example" {
  repository_id = github_repository.terra-created.node_id

  pattern          = "main"
  enforce_admins   = true
  allows_deletions = true
}

resource "github_repository_file" "gitignore" {
    repository = github_repository.terra-created.name
    file = ".gitignore"
    content = "**/*.tfstate"
    commit_message = "created by terraform"
    commit_author = "terraform user"
    commit_email = "terraform@example.com"
    overwrite_on_create = true
}

