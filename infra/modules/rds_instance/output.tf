output "id_rds" {
    value = aws_db_instance.postgres_db.id
}

output "id_database" {
  value = aws_db_instance.postgres_db.identifier
}