locals {
  is_prod = var.environment == "prod" ? true : false
}

locals {
  is_mssql = element(split("-", var.engine), 0) == "sqlserver"

  monitoring_role_arn = var.create_monitoring_role ? aws_iam_role.enhanced_monitoring[0].arn : var.monitoring_role_arn
}


locals {
  enhanced_monitoring_iam_role_name = element(concat(aws_iam_role.enhanced_monitoring.*.name, [""]), 0)
  enhanced_monitoring_iam_role_arn  = element(concat(aws_iam_role.enhanced_monitoring.*.arn, [""]), 0)
  db_instance_address               = element(concat(aws_db_instance.this_mssql.*.address, aws_db_instance.this.*.address, [""]), 0)
  db_instance_arn                   = element(concat(aws_db_instance.this_mssql.*.arn, aws_db_instance.this.*.arn, [""]), 0)
  db_instance_availability_zone     = element(concat(aws_db_instance.this_mssql.*.availability_zone, aws_db_instance.this.*.availability_zone, [""]), 0)
  db_instance_endpoint              = element(concat(aws_db_instance.this_mssql.*.endpoint, aws_db_instance.this.*.endpoint, [""]), 0)
  db_instance_hosted_zone_id        = element(concat(aws_db_instance.this_mssql.*.hosted_zone_id, aws_db_instance.this.*.hosted_zone_id, [""]), 0)
  db_instance_id                    = element(concat(aws_db_instance.this_mssql.*.id, aws_db_instance.this.*.id, [""]), 0)
  db_instance_resource_id           = element(concat(aws_db_instance.this_mssql.*.resource_id, aws_db_instance.this.*.resource_id, [""]), 0)
  db_instance_status                = element(concat(aws_db_instance.this_mssql.*.status, aws_db_instance.this.*.status, [""]), 0)
  db_instance_name                  = element(concat(aws_db_instance.this_mssql.*.name, aws_db_instance.this.*.name, [""]), 0)
  db_instance_username              = element(concat(aws_db_instance.this_mssql.*.username, aws_db_instance.this.*.username, [""]), 0)
  db_instance_port                  = element(concat(aws_db_instance.this_mssql.*.port, aws_db_instance.this.*.port, [""]), 0)
  db_instance_ca_cert_identifier    = element(concat(aws_db_instance.this_mssql.*.ca_cert_identifier, aws_db_instance.this.*.ca_cert_identifier, [""]), 0)
  db_instance_domain                = element(concat(aws_db_instance.this_mssql.*.domain, [""]), 0)
  db_instance_domain_iam_role_name  = element(concat(aws_db_instance.this_mssql.*.domain_iam_role_name, [""]), 0)
  db_instance_master_password       = element(concat(aws_db_instance.this_mssql.*.password, aws_db_instance.this.*.password, [""]), 0)
}