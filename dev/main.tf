module "terraform_data" {
  source         = "../modules/terraform_data"
  env            = var.env
  objects        = var.objects
  subenv_objects = var.subenv_objects
}

output "object_names" {
  value = module.terraform_data.name
}

