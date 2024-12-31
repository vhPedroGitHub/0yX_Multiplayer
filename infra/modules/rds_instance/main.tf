# Crear la instancia RDS de PostgreSQL
resource "aws_db_instance" "postgres_db" {
  allocated_storage  = 20  
  engine             = var.engine
  engine_version     = var.engine_version  
  instance_class     = var.instance_class  
  db_name            = var.dbname  
  username           = var.username 
  password           = var.password  
  
  skip_final_snapshot   = true
  
  publicly_accessible    = false

  vpc_security_group_ids = var.security_group
  
  db_subnet_group_name   = aws_db_subnet_group.subnet_group_rds.name
  
  tags = {
    Name = "${var.name}-data-base"
  }
}

resource "aws_db_subnet_group" "subnet_group_rds" {
  name        = "subnet-group"
  subnet_ids  = var.subnet_ids
  tags = var.tags
}