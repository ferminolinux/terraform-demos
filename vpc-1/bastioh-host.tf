## EC2 bastion host
resource "aws_instance" "alos9-bh-demo" {
  ami           = var.ALOS9_AMI
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
}

resource "aws_network_interface" "alo9-bh-nic1-demo" {
  subnet_id       = aws_subnet.pub-subnet-demo.id
  private_ip     = "172.16.1.254"
  security_groups = [aws_vpc.vpc-demo.default_security_group_id]

  attachment {
    instance     = aws_instance.alos9-bh-demo.id
    device_index = 1
  }
}

resource "aws_network_interface" "alo9-bh-nic2-demo" {
  subnet_id       = aws_subnet.priv-subnet-demo.id
  private_ip     = "172.16.2.254"
  security_groups = [aws_vpc.vpc-demo.default_security_group_id]

  attachment {
    instance = aws_instance.alos9-bh-demo.id
    device_index = 2
  }
}