module "org" {
    source = "./modules/org-organization"
    name = "abbe-org"
    members = [ "abbewasuqe1" ]
}
output "id" {
  description = "The ID of the organization."
  value       = module.org.id
}