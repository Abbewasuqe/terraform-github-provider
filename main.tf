module "import" {
    source = "./modules/repository/"
    name = "demo-repository"
}

module "terraform-test-repo" {
    source = "./modules/repository/"
    name = "Terraform-test-repo"
}
