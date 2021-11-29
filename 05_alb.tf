resource "aws_lb" "zero_alb" {
  name               = "zero-alb"
  internal           = false
  load_balancer_type = var.load_type
  security_groups    = [aws_security_group.zero_sg.id]
  subnets            = [aws_subnet.zero_pub[0].id, aws_subnet.zero_pub[1].id]
  tags = {
    "Name" = "${var.name}-alb"
  }
}

output "dns_name" {
  value = aws_lb.zero_alb.dns_name
}

resource "aws_lb_target_group" "zero_albtg" {
  name     = "zero-albtg"
  port     = var.port_http
  protocol = var.HTTP
  vpc_id   = aws_vpc.zero_vpc.id

  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 5
    matcher             = "200"
    path                = "/health.html"
    port                = "traffic-port"
    protocol            = var.HTTP
    timeout             = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "zero_alblis" {
  load_balancer_arn = aws_lb.zero_alb.arn
  port              = var.port_http
  protocol          = var.HTTP

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.zero_albtg.arn
  }

}

resource "aws_lb_target_group_attachment" "zero_albgatt" {
  target_group_arn = aws_lb_target_group.zero_albtg.arn
  target_id        = aws_instance.zero_web.id
  port             = var.port_http
} 

