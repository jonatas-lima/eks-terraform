output "public_subnet_1a_cidr_block" {
  value = aws_subnet.public-1a.cidr_block
}

output "public_subnet_1b_cidr_block" {
  value = aws_subnet.public-1b.cidr_block
}

output "private_subnet_1a_cidr_block" {
  value = aws_subnet.private-1a.cidr_block
}

output "private_subnet_1b_cidr_block" {
  value = aws_subnet.private-1b.cidr_block
}

output "public_subnet_1a_id" {
  value = aws_subnet.public-1a.id
}

output "public_subnet_1b_id" {
  value = aws_subnet.public-1b.id
}

output "private_subnet_1a_id" {
  value = aws_subnet.private-1a.id
}

output "private_subnet_1b_id" {
  value = aws_subnet.private-1b.id
}
