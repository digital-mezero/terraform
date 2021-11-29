resource "aws_route_table_association" "zero_ngwass_pri_a" {
  subnet_id      = aws_subnet.zero_pri_a.id
  route_table_id = aws_route_table.zero_ngwrt.id
}

resource "aws_route_table_association" "zero_ngwass_pri_c" {
  subnet_id      = aws_subnet.zero_pri_c.id
  route_table_id = aws_route_table.zero_ngwrt.id
}

resource "aws_route_table_association" "zero_ngwass_priDB_a" {
  subnet_id      = aws_subnet.zero_priDB_a.id
  route_table_id = aws_route_table.zero_ngwrt.id
}

resource "aws_route_table_association" "zero_ngwass_priDB_c" {
  subnet_id      = aws_subnet.zero_priDB_c.id
  route_table_id = aws_route_table.zero_ngwrt.id
}
