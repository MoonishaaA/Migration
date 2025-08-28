# Project & Region
project_id = "my-project-learning-464616"
region     = "us-central1"

# Networking
vpc_name    = "my-vpc"
subnet_name = "my-subnet"
subnet_cidr = "10.0.1.0/24"

# Cluster
cluster_name = "my-gke-cluster"

# Compute
# (Optional VM configs if module variables exist)

# Bucket
bucket_name = "mminiproject-bucket"

# Secret Manager
secret_id   = "db-password"
db_password = "SuperSecret123!"  # Can also use Terraform variables or secrets

# SQL
db_name = "mydatabase"
db_user = "dbadmin"

boot_image = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2204-lts"
