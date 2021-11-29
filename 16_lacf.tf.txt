resource "aws_launch_configuration" "zero_lacf" {
  name                 = "zero-ami"
  image_id             = aws_ami_from_instance.zero_ami.id
  instance_type        = "t2.micro"
  iam_instance_profile = "admin_role"
  security_groups      = [aws_security_group.zero_sg.id]
  key_name             = "zero_key"
  user_data            = <<-EOF
                #!/bin/bash
                systemctl start httpd
                systemctl enable httpd
                EOF
}
