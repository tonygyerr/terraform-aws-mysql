# resource "aws_db_subnet_group" "mysql" {
#   name       = "${var.app_name}-${var.environment}-subnet-group"
#   subnet_ids = "${var.private_db_subnet_ids}"
# }