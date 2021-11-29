resource "aws_db_instance" "zero_mydb" {
  allocated_storage      = var.all_size
  storage_type           = var.db_type
  engine                 = var.mysql
  engine_version         = var.db_version
  instance_class         = var.db_class
  name                   = var.db_name
  identifier             = var.db_name
  username               = var.db_id
  password               = var.db_passwd
  parameter_group_name   = var.parameter_group_name
  availability_zone      = "${var.region}${var.ava_zone[0]}"
  db_subnet_group_name   = aws_db_subnet_group.zero_dbsg.id
  vpc_security_group_ids = [aws_security_group.zero_sg.id]
  skip_final_snapshot    = true
  tags = {
    "Name" = "${var.name}-db"
  }
}
resource "aws_db_subnet_group" "zero_dbsg" {
  name       = "zero-dbsg"
  subnet_ids = [aws_subnet.zero_priDB[0].id, aws_subnet.zero_priDB[1].id]

}
