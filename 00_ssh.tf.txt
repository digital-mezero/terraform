resource "aws_key_pair" "zerokey" {
  key_name   = "zero_key"
  public_key = file("../../.ssh/tf-key-pair.pub")
}
