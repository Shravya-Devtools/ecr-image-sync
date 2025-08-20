provider "aws" {
  region = "us-east-1"
}

variable "repositories" {
  type = list(string)
}

module "ecr" {
  for_each        = toset(var.repositories)
  source          = "./modules/ecr"
  repository_name = each.value
}
