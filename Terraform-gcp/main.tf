module "networking" {
  source       = "./module/networking"
  project_id   = var.project_id
  region       = var.region
  vpc_name     = var.vpc_name
  subnet_name  = var.subnet_name
  subnet_cidr  = var.subnet_cidr
}

module "compute" {
  source    = "./module/compute"
  region    = var.region
  vpc_id    = module.networking.vpc_id
  subnet_id = module.networking.subnet_id
}
module "bucket" {
  source      = "./module/bucket"
  region      = var.region
  bucket_name = var.bucket_name
}
module "cluster" {
  source       = "./module/cluster"
  cluster_name = var.cluster_name
  region       = var.region
  vpc_id       = module.networking.vpc_id
  subnet_id    = module.networking.subnet_id
}
module "sql" {
  source             = "./module/sql"
  project_id         = var.project_id
  region             = var.region
  db_name            = var.db_name
  db_user            = var.db_user
  db_password        = var.db_password
  depends_on         = [module.secret_manager]
  private_network_id = module.networking.vpc_id
}
module "secret_manager" {
  source      = "./module/secret_manager"
  project_id  = var.project_id
  secret_id   = var.secret_id
  db_password = var.db_password
}
data "google_secret_manager_secret_version" "db_password" {
  secret     = module.secret_manager.secret_name
  depends_on = [module.secret_manager]
}
