
## EC2 in public subnet
resource "aws_instance" "alos9-1-demo" {
  ami           = var.ALOS9_AMI
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
}

resource "aws_network_interface" "alos9-1-nic-demo" {
  subnet_id       = aws_subnet.pub-subnet-demo.id
  private_ip = "172.16.1.15"
  security_groups = [aws_vpc.vpc-demo.default_security_group_id]

  attachment {
    instance     = aws_instance.alos9-1-demo.id
    device_index = 1
  }
}


# EC2 in private subnet
resource "aws_instance" "alos9-2-demo" {
  ami           = var.ALOS9_AMI
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
}

resource "aws_network_interface" "alos9-2-nic-demo" {
  subnet_id       = aws_subnet.priv-subnet-demo.id
  private_ip     = "172.16.2.15"
  security_groups = [aws_vpc.vpc-demo.default_security_group_id, aws_security_group.sg-bh-demo.id]

  attachment {
    instance     = aws_instance.alos9-2-demo.id
    device_index = 1
  }
}