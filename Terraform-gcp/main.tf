provider "google" {
  project = var.project_id
  region  = var.region
}

# Networking Module
module "networking" {
  source        = "./modules/networking"
  vpc_name      = var.vpc_name
  subnet_name   = var.subnet_name
  subnet_cidr   = var.subnet_cidr
  region        = var.region
  project_id    = var.project_id
}

# Compute Module
module "compute" {
  source    = "./modules/compute"
  region    = var.region
  vpc_id    = module.networking.vpc_id
  subnet_id = module.networking.subnet_id
}

# Cluster Module
module "cluster" {
  source       = "./modules/cluster"
  cluster_name = var.cluster_name
  region       = var.region
  vpc_id       = module.networking.vpc_id
  subnet_id    = module.networking.subnet_id
}

# Bucket Module
module "bucket" {
  source      = "./modules/bucket"
  bucket_name = var.bucket_name
  region      = var.region
}

# Secret Manager Module
module "secret_manager" {
  source      = "./modules/secret_manager"
  project_id  = var.project_id
  secret_id   = var.secret_id
  secret_data = var.db_password
}

# SQL Module
module "sql" {
  source             = "./modules/sql"
  project_id         = var.project_id
  region             = var.region
  private_network_id = module.networking.vpc_id
  db_name            = var.db_name
  db_user            = var.db_user
  db_password        = module.secret_manager.secret_data
}
