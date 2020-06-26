provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = "eu-west-1"
}

variable "access_key" { type = string }
variable "secret_key" { type = string }

module "label" {
  source  = "../"
  context = "Projet alios"
  stage   = "poc"
  additional_tags = {
    owner : "Romain"
    cost_center : "c12345"
    business_unit : "R6"
  }
}

output "tags" {
  value = module.label.tags
}

