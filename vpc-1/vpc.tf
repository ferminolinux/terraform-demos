resource "aws_vpc" "vpc-demo-1" {
    cidr_block = "172.23.0.0/16"
    
}

resource "aws_subnet" "subnet-demo1" {
    vpc_id = aws_vpc.vpc-demo-1.id
    cidr_block = "172.23.1.0/24"
    map_public_ip_on_launch = true
    availability_zone = "us-east-1a"
}
