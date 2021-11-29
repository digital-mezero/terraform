resource "aws_ami_from_instance" "zero_ami" {
  name               = "zero-ami"
  source_instance_id = aws_instance.zero_web.id
  depends_on = [
    aws_instance.zero_web
  ]
}
