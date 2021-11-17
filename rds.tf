# resource "random_id" "rds" {
#   byte_length = var.rds["password_length"] * 3 / 4
# }

# resource "aws_rds_cluster" "rds" {
#   apply_immediately               = "${var.apply_immediately}"
#   backup_retention_period         = "${var.bu_retention}"
#   database_name                   = "${var.initial_db}" # initial database name
#   # db_cluster_parameter_group_name = "${aws_rds_cluster_parameter_group.rds-cluster-pg.id}"
#   db_subnet_group_name            = "${aws_db_subnet_group.mysql.name}" #"${var.subnet_group_name}"
#   final_snapshot_identifier       = "${var.final_snapshot_identifier}"
#   # kms_key_id                      = "${aws_kms_key.aurora.arn}"
#   master_password                 = "${var.master_password}" #random_id.rds.b64_std
#   master_username                 = "${var.username}" #data.aws_secretsmanager_secret.rds.name
#   preferred_backup_window         = "${var.preferred_backup_window}"
#   preferred_maintenance_window    = "${var.maint_window}"
#   skip_final_snapshot             = "${var.skip_final_snapshot}"
#   storage_encrypted               = "${var.storage_encrypted}"
#   vpc_security_group_ids          = ["${aws_security_group.rds.id}"]
#   cluster_identifier              = "${var.cluster_identifier}"

#   lifecycle {
#     prevent_destroy = "false"
#   }
# }

# resource "aws_rds_cluster_instance" "rds" {
#   count                        = "${var.cluster_size}"
#   apply_immediately            = "${var.apply_immediately}"
#   cluster_identifier           = "${aws_rds_cluster.rds.id}"
#   db_parameter_group_name      = "default.mysql5.7"
#   db_subnet_group_name         = "${aws_db_subnet_group.mysql.name}" #"${var.subnet_group_name}"
#   identifier                   = "rds-mysql-cluster-${count.index}"
#   instance_class               = "${var.instance_class}"
#   monitoring_interval          = "${var.monitoring_interval}"
#   monitoring_role_arn          = "${var.monitoring_role_arn}"
#   publicly_accessible          = "${var.publicly_accessible}"
#   preferred_maintenance_window = "${var.maint_window}"
#   tags                         = "${var.tags}"
# }

# # resource "aws_db_option_group" "aurora-05-06-api-og" {
# #   name                     = "mysql-08-20-api-og"
# #   option_group_description = "app customer notification db, email notification db, text notification db, voice notification db, sql rds option group"
# #   engine_name              = "${var.engine_name}"
# #   major_engine_version     = "${var.engine_version}"

# #   option {
# #     option_name = var.option_name

# #     option_settings {
# #       name  = "TIME_ZONE"
# #       value = "CST"
# #     }
# #   }
# # }

# # resource "aws_db_parameter_group" "rds-db-pg" {
# #   name        = "rds-db-pg"
# #   family      = "${var.cluster_version}"
# #   description = "app mysql parameter group"
# #   # parameter   = ["${var.cluster_parameters}"]

# #   tags = {
# #     Name = "${var.app_name}-mysql-db-pg"
# #   }
# # }

# # resource "aws_rds_cluster_parameter_group" "rds-cluster-pg" {
# #   name        = "rds-cluster-pg"
# #   family      = "${var.cluster_version}"
# #   description = "app cluster parameter group"
# #   # parameter   = ["${var.cluster_parameters}"]

# #   tags = {
# #     Name = "${var.app_name}-rds-cluster-pg"
# #   }
# # }

# # resource "aws_rds_cluster_parameter_group" "rds-cluster-pg" {
# #   name_prefix = "${var.app_name}-rds-cluster-pg"
# #   description = "DB cluster parameter group"
# #   family      = "mysql5.7"

# #   dynamic "parameter" {
# #     for_each = var.cluster_parameters
# #     content {
# #       apply_method = lookup(parameter.value, "apply_method", null)
# #       name         = parameter.value.name
# #       value        = parameter.value.value
# #     }
# #   }

# #   tags = {
# #     Name = "${var.app_name}-rds-cluster-pg"
# #   }

# #   lifecycle {
# #     create_before_destroy = true
# #   }
# # }