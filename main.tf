module "import" {
    source = "./modules/repository/"
    name = "demo-repository"
    admin_teams = [ "mama" ]
}

module "terraform-test-repo" {
    source = "./modules/repository/"
    name = "Terraform-test-repo"
    admin_teams = [ "mama" ]
    maintain_collaborators = [ "abbewasuqe1" ]
}
