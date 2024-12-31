resource "aws_security_group" "SG" {
  name        = var.grup_sg_name
  description = var.grup_sg_description
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
}

resource "aws_security_group" "SG_BD" {
  name        = var.grup_sg_name_bd
  description = var.grup_sg_description_bd
  vpc_id      = var.vpc_id

  ingress {
    from_port   = "5432"
    to_port     = "5432"
    protocol    = "tcp"
    security_groups = [aws_security_group.SG.id]
  }
  
  dynamic "egress" {
    for_each = var.egress_rules_bd
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
}