resource "aws_msk_serverless_cluster" "main" {
  cluster_name = "${var.context_name}-${var.environment}-msk"

  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = [aws_security_group.main.id]
  }

  client_authentication {
    sasl {
      iam {
        enabled = true
      }
    }
  }

  tags = merge(var.common_tags, {
    Name = "${var.context_name}-${var.environment}-msk"
  })
}