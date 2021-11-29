resource "aws_lb_target_group_attachment" "zero_albgatt" {
  target_group_arn = aws_lb_target_group.zero_albtg.arn
  target_id        = aws_instance.zero_web.id
  port             = 80
} 
