# provider "aws" {
#   region = local.region
# }

locals {
  name   = var.name
  region = "us-east-1"
  tags = {
    Owner       = "user"
    Environment = "test"
  }
}


module "db" {
  source = "git::https://github.com/tonygyerr/terraform-aws-mysql.git"

  vpc_id                = var.vpc_id
  iam_enabled           = var.iam_enabled
  environment           = var.environment
  param_name            = var.param_name
  instance_identifier   = var.instance_identifier
  cluster_identifier    = var.cluster_identifier
  secret_name           = var.secret_name
  private_db_subnet_ids = var.private_db_subnet_ids
  kms_alias_aurora      = var.kms_alias_aurora
  role                  = var.role
  db_port               = var.db_port

  identifier           = local.name
  engine               = var.engine
  engine_version       = var.engine_version
  family               = var.family
  major_engine_version = "5.0"         #"8.0"      # DB option group
  instance_class       = "db.t3.small" #"db.t3.large"

  allocated_storage     = 20
  max_allocated_storage = 100
  storage_encrypted     = false

  name     = var.initial_db
  username = var.username
  password = var.password
  port     = 3306

  multi_az               = true
  subnet_ids             = var.private_db_subnet_ids
  vpc_security_group_ids = var.vpc_security_group_ids

  maintenance_window              = "Mon:00:00-Mon:03:00"
  backup_window                   = "03:00-06:00"
  enabled_cloudwatch_logs_exports = ["general"]

  backup_retention_period = 0
  skip_final_snapshot     = true
  deletion_protection     = false

  performance_insights_enabled          = true
  performance_insights_retention_period = 7
  create_monitoring_role                = true
  monitoring_interval                   = 60

  parameters = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ]

  tags = local.tags
  db_instance_tags = {
    "Sensitive" = "high"
  }
  db_option_group_tags = {
    "Sensitive" = "low"
  }
  db_parameter_group_tags = {
    "Sensitive" = "low"
  }
  db_subnet_group_tags = {
    "Sensitive" = "high"
  }
}