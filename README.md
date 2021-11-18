## Module MySQL
```hcl
module "db" {
  source = "git::https://github.com/tonygyerr/terraform-aws-mysql.git"

  private_db_subnet_ids  = ["subnet-*********123", "subnet-*********456", "subnet-*********789"] #enter database subnet ids for the application subnets that will need access to database
  secret_name            = "RDS-Master_User"
  vpc_security_group_ids = ["sg-*********123"]
  vpc_id                 = "vpc-*********123"
  kms_alias_aurora       = "myappdb-rds-kms-key"
  allocated_storage                   = 5
  backup_window                       = "03:00-06:00"
  cluster_identifier                  = "myapp-test-cluster"
  cluster_version                     = "mysql5.7"
  create_monitoring_role              = true
  db_port                             = "3306"
  deletion_protection                 = true
  engine                              = "mysql"
  engine_version                      = "5.7.33"
  environment                         = "test"
  family                              = "mysql5.7"
  iam_database_authentication_enabled = true
  iam_enabled                         = "true"
  identifier                          = "myappnamedb"
  initial_db                          = "myapp_service_db"
  instance_class                      = "db.m3.medium"
  instance_identifier                 = "myapp-mysql58-test"
  maintenance_window                  = "Mon:00:00-Mon:03:00"
  major_engine_version                = "5.7"
  monitoring_interval                 = "30"
  monitoring_role_name                = "myapp-rds-monitoring-role" #"AmazonRDSEnhancedMonitoringRole"
  name                                = "myapp-mysql"
  password                            = aws_secretsmanager_secret_version.rds.secret_string
  param_name                          = "my_rds_param"
  port                                = "3306"
  role                                = "myapp-rds-monitoring-role"
  username                            = "myapp_test_user"
  tags                                = var.tags

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

  options = [
    {
      option_name = "MARIADB_AUDIT_PLUGIN"

      option_settings = [
        {
          name  = "SERVER_AUDIT_EVENTS"
          value = "CONNECT"
        },
        {
          name  = "SERVER_AUDIT_FILE_ROTATIONS"
          value = "37"
        },
      ]
    },
  ]

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
```