resource "aws_internet_gateway" "zero_ig" {
  vpc_id = aws_vpc.zero_vpc.id

  tags = {
    "Name" = "${var.name}-ig"
  }
}

resource "aws_route_table" "zero_rt" {
  vpc_id = aws_vpc.zero_vpc.id

  route {
    cidr_block = var.cidr_route
    gateway_id = aws_internet_gateway.zero_ig.id
  }

  tags = {
    "Name" = "${var.name}-rt"
  }
}

# public subnet a,c 연결
resource "aws_route_table_association" "zero_igas_pub" {
  count          = 2
  subnet_id      = aws_subnet.zero_pub[count.index].id
  route_table_id = aws_route_table.zero_rt.id
}


