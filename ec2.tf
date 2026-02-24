resource "aws_instance" "aircanada_ec2" {
  count         = 3
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  subnet_id     = aws_subnet.AC_Public.id
  tags = {
    Name = "AirCanada-EC2-${count.index + 1}"
    Env  = "Prod"
  }
}