


module "vpc" {
  source = "./modules/vpc"

  vpc_cidr         = var.vpc_cidr
  region           = var.region
  public_subnets   = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones = ["${var.region}a", "${var.region}b"]
}

module "eks" {
  source = "./modules/eks"

  cluster_name    = var.cluster_name
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  public_subnets  = module.vpc.public_subnets
}

module "rds" {
  source = "./modules/rds"

  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
  db_name         = "mydb"
  db_username     = "admin"
  db_password     = "securepassword123"
}

module "elasticache" {
  source = "./modules/elasticache"

  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
}

module "s3" {
  source = "./modules/s3"
  bucket_name = "my-app-assets"
}