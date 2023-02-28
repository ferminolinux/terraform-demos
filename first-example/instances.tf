resource "aws_instance" "suse" {
    ami = "ami-0dacd9d37849a9f38"
    instance_type = "t2.micro"
}