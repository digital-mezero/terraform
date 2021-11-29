resource "aws_autoscaling_attachment" "zero_asatt" {
  autoscaling_group_name = aws_autoscaling_group.zero_atsg.id
  alb_target_group_arn   = aws_lb_target_group.zero_albtg.arn
} 
