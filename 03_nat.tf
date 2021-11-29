resource "aws_eip" "zero_ngw_ip" {
  vpc = true
}

resource "aws_nat_gateway" "zero_ngw" {
  allocation_id = aws_eip.zero_ngw_ip.id
  subnet_id     = aws_subnet.zero_pub[0].id
  tags = {
    "Name" = "${var.name}-ngw"
  }
}

resource "aws_route_table" "zero_ngwrt" {
  vpc_id = aws_vpc.zero_vpc.id

  route {
    cidr_block = var.cidr_route
    gateway_id = aws_nat_gateway.zero_ngw.id
  }
  tags = {
    "Name" = "${var.name}-ngwrt"
  }
}

resource "aws_route_table_association" "zero_ngwass_pri" {
  count          = length(var.pri_sub)
  subnet_id      = aws_subnet.zero_pri[count.index].id
  route_table_id = aws_route_table.zero_ngwrt.id
}


resource "aws_route_table_association" "zero_ngwass_priDB" {
  count          = length(var.pri_subdb)
  subnet_id      = aws_subnet.zero_priDB[count.index].id
  route_table_id = aws_route_table.zero_ngwrt.id
}
