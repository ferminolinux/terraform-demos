output "subnet-id" {
  value = aws_subnet.subnet-demo.id
}

output "security-group-id" {
  value = aws_security_group.demo-1
}