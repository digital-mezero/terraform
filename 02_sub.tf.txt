# 1. 가용영역 a의 public subnet
resource "aws_subnet" "zero_pub_a" {
  vpc_id            = aws_vpc.zero_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "zero-pub_a"
  }
}
# 2. 가용영역 c의 public subnet
resource "aws_subnet" "zero_pub_c" {
  vpc_id            = aws_vpc.zero_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "zero-pub_c"
  }
}
# 3. 가용영역 a의 private subnet
resource "aws_subnet" "zero_pri_a" {
  vpc_id            = aws_vpc.zero_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "zero-pri_a"
  }
}
# 4. 가용영역 c의 private subnet
resource "aws_subnet" "zero_pri_c" {
  vpc_id            = aws_vpc.zero_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "zero-pri_c"
  }
}
# 5. 가용영역 a의 private DB subnet
resource "aws_subnet" "zero_priDB_a" {
  vpc_id            = aws_vpc.zero_vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "zero-priDB_a"
  }
}
# 6. 가용영역 c의 private DB subnet
resource "aws_subnet" "zero_priDB_c" {
  vpc_id            = aws_vpc.zero_vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "zero-priDB_c"
  }
}
