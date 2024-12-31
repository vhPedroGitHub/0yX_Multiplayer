output "vpc_id" {
  value       = aws_vpc.vpc.id
  description = "vpc id"
}

output "public_subnet_ids" {
  value       = aws_subnet.public_subnet[*].id
  description = "list of ids of public subnets"
}
output "public_subnet_cidrs" {
  value       = aws_subnet.public_subnet[*].cidr_block
  description = "list of cidr block of public subnets"
}
output "private_subnet_ids" {
  value       = aws_subnet.private_subnet[*].id
  description = "list of ids of private subnets"
}
output "private_subnet_cidrs" {
  value       = aws_subnet.private_subnet[*].cidr_block
  description = "list of cidr block of public subnets"
}

output "igw_id" {
  value       = aws_internet_gateway.igw.id
  description = "id of internet gateway"
}
output "nat_id" {
  value       = aws_nat_gateway.my_nat.*.id
  description = "id of nat gateway."
}
