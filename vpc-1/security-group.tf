resource "aws_security_group" "sg-bh-demo" {
  name   = "allow_ssh_from_bh"
  vpc_id = aws_vpc.vpc-demo.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.16.1.0/24"]
  }
}
