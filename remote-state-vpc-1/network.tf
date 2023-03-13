resource "aws_vpc" "vpc-demo" {
  cidr_block = "172.23.0.0/16"

  tags = {
    Name = "vpc-terraform-1"
  }
}

resource "aws_subnet" "subnet-demo" {
  vpc_id     = aws_vpc.vpc-demo.id
  cidr_block = "172.23.1.0/24"

  tags = {
    Name = "subnet-${aws_vpc.vpc-demo.tags["Name"]}"
  }
}

resource "aws_internet_gateway" "igw-demo" {
  vpc_id = aws_vpc.vpc-demo.id

  tags = {
    Name = "igw-${aws_vpc.vpc-demo.tags["Name"]}"
  }
}

resource "aws_route_table" "rt-demo" {
  vpc_id = aws_vpc.vpc-demo.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-demo.id
  }

  tags = {
    Name = "rt-${aws_vpc.vpc-demo.tags["Name"]}"
  }
}

resource "aws_route_table_association" "rta-demo" {
  subnet_id      = aws_subnet.subnet-demo.id
  route_table_id = aws_route_table.rt-demo.id
}

resource "aws_security_group" "demo-1" {
  name        = "demo-1"
  description = "allow ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}