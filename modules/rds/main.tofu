resource "aws_db_subnet_group" "main" {
  name       = var.subnet_group_name
  subnet_ids = var.subnet_ids

  tags = merge(var.common_tags, {
    Name = var.subnet_group_name
  })
}

resource "aws_db_parameter_group" "main" {
  name   = var.parameter_group_name
  family = "${var.engine}${var.engine_version}"

  dynamic "parameter" {
    for_each = var.parameter_group_options
    content {
      name         = parameter.key
      value        = parameter.value
      apply_method = "pending-reboot"
    }
  }

  tags = merge(var.common_tags, {
    Name = var.parameter_group_name
  })
}

resource "aws_db_instance" "main" {
  identifier                  = "${var.context_name}-${var.environment}-db"
  allocated_storage           = var.allocated_storage
  db_name                     = var.db_name
  engine                      = var.engine
  engine_version              = var.engine_version
  instance_class              = var.instance_class
  port                        = var.port
  username                    = var.username
  manage_master_user_password = true
  parameter_group_name        = var.parameter_group_name
  db_subnet_group_name        = aws_db_subnet_group.main.name
  skip_final_snapshot         = var.skip_final_snapshot
  multi_az                    = false
  vpc_security_group_ids      = [aws_security_group.main.id]
  apply_immediately           = var.apply_immediately

  tags = merge(var.common_tags, {
    Name = "${var.context_name}-${var.environment}-db"
  })
}