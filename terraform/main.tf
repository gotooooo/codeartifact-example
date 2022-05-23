module "codeartifact" {
  source = "./modules/codeartifact"

  domain_name     = "example"
  repository_name = "lib"
}
