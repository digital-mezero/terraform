resource "aws_internet_gateway" "zero_ig" {
  vpc_id = aws_vpc.zero_vpc.id

  tags = {
    "Name" = "zero-ig"
  }
}
