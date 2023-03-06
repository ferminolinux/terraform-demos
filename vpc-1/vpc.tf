resource "aws_vpc" "vpc-demo" {
  cidr_block = "172.16.0.0/16"
}

# Subnets
resource "aws_subnet" "pub-subnet-demo" {
  vpc_id                  = aws_vpc.vpc-demo.id
  cidr_block              = "172.16.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
}

resource "aws_subnet" "priv-subnet-demo" {
  vpc_id                  = aws_vpc.vpc-demo.id
  cidr_block              = "172.16.2.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1a"
}

# Gateways
resource "aws_internet_gateway" "igw-demo" {
  vpc_id = aws_vpc.vpc-demo.id
}

resource "aws_nat_gateway" "ngw" {
  subnet_id = aws_subnet.priv-subnet-demo.id
}

# Routing tables
resource "aws_route_table" "pub-subnet-rt-demo" {
  vpc_id = aws_vpc.vpc-demo.id

  route {
    cidr_block = "172.16.1.0/24"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-demo.id
  }
}

resource "aws_route_table" "priv-subnet-rt-demo" {
  vpc_id = aws_vpc.vpc-demo.id

  route {
    cidr_block = "172.16.2.0/24"
  }

  route {
    cidr_block = "0.0.0.0"
    gateway_id = aws_nat_gateway.ngw.id
  }
}



