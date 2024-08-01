output "vpc_id" {
  description = "VPC id"
  value = aws_vpc.main.id
}

output "public_subnets" {
  value = [for s in aws_subnet.public_subnets:s.id]  
}

output "private_subnets" {
  value = [for s in aws_subnet.private_subnets:s.id]  
}