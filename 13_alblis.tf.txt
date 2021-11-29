resource "aws_lb_listener" "zero_alblis" {
  load_balancer_arn = aws_lb.zero_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.zero_albtg.arn
  }

}
