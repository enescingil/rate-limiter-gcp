module "instance_template" {
  source  = "terraform-google-modules/vm/google//modules/instance_template" #To be changed to the external source
  version = "~> 11.0"

  project_id         = var.project_id
  subnetwork         = var.subnetwork
  service_account    = var.service_account
  subnetwork_project = var.project_id
}

module "mig" {
  source  = "terraform-google-modules/vm/google//modules/mig" #To be changed to the external source
  version = "~> 11.0"

  project_id        = var.project_id
  region            = var.region
  target_size       = var.target_size
  hostname          = "mig-simple"
  instance_template = module.instance_template.self_link
}