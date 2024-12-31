output "id" {
  value = aws_security_group.SG.id
}

output "id_db" {
  value = aws_security_group.SG_BD.id  
}

output "sg" {
  value = aws_security_group.SG
}