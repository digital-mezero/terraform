resource "aws_lb" "zero_alb" {
  name               = "zero-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.zero_sg.id]
  subnets            = [aws_subnet.zero_pub_a.id, aws_subnet.zero_pub_c.id]
  tags = {
    "Name" = "zero-alb"
  }
}

output "dns_name" {
  value = aws_lb.zero_alb.dns_name
}
