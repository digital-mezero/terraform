resource "aws_eip" "zero_ngw_ip" {
  vpc = true
}

resource "aws_nat_gateway" "zero_ngw" {
  allocation_id = aws_eip.zero_ngw_ip.id
  subnet_id     = aws_subnet.zero_pub_a.id
  tags = {
    "Name" = "zero-ngw"
  }
}
