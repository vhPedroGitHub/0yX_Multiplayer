output "ip_address" {
    value = aws_instance.server.public_ip
}

output "id_server" {
    value = aws_instance.server.id
}

output "ami_server" {
  value = aws_instance.server.ami
}

output "instance_type_server" {
    value = aws_instance.server.instance_type
}

output "public_dns" {
    value = aws_instance.server.public_dns
}
