
resource "aws_network_interface" "ec2-alos9-demo-1" {
  subnet_id  = aws_subnet.subnet-demo1.id
  private_ips = ["172.23.1.250"]
}

output "public-ip" {
  value = "Instance public ip ${aws_instance.ec2-alos9-demo-1.public_ip}"
}

resource "aws_instance" "ec2-alos9-demo-1" {
  ami           = "ami-05961978ff95b54df"
  instance_type = "t2.micro"

  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.ec2-alos9-demo-1.id
  }
}