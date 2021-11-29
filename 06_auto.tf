resource "aws_launch_configuration" "zero_lacf" {
  name                 = "zero-ami"
  image_id             = aws_ami_from_instance.zero_ami.id
  instance_type        = var.ec2_type
  iam_instance_profile = var.iam_role
  security_groups      = [aws_security_group.zero_sg.id]
  key_name             = var.key
  user_data            = <<-EOF
                #!/bin/bash
                systemctl start httpd
                systemctl enable httpd
                EOF
}

resource "aws_placement_group" "zero_pg" {
  name     = "zero-pg"
  strategy = var.pg_strategy
}

resource "aws_autoscaling_group" "zero_atsg" {
  name                      = "zero-atsg"
  min_size                  = 2
  max_size                  = 10
  health_check_grace_period = 60
  health_check_type         = "EC2"
  desired_capacity          = 2
  force_delete              = false
  launch_configuration      = aws_launch_configuration.zero_lacf.name
  #placement_group = aws_placement_group.zero_pg.id
  vpc_zone_identifier = [aws_subnet.zero_pub[0].id, aws_subnet.zero_pub[0].id]
}

resource "aws_autoscaling_attachment" "zero_asatt" {
  autoscaling_group_name = aws_autoscaling_group.zero_atsg.id
  alb_target_group_arn   = aws_lb_target_group.zero_albtg.arn
} 

