resource "aws_key_pair" "zerokey" {
  key_name   = var.key
  public_key = file("../../.ssh/tf-key-pair.pub")
}

provider "aws" {
  region = var.region
}

resource "aws_vpc" "zero_vpc" {
  cidr_block           = var.cidr_main
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "Name" = "${var.name}-vpc"
  }
}

# 1. 가용영역 a의 public subnet
resource "aws_subnet" "zero_pub" {
  count             = length(var.pub_sub)
  vpc_id            = aws_vpc.zero_vpc.id
  cidr_block        = var.pub_sub[count.index]
  availability_zone = "${var.region}${var.ava_zone[count.index]}"
  tags = {
    "Name" = "${var.name}-pub${var.ava_zone[count.index]}"
  }
}

# 3. 가용영역 a의 private subnet
resource "aws_subnet" "zero_pri" {
  count             = 2
  vpc_id            = aws_vpc.zero_vpc.id
  cidr_block        = var.pri_sub[count.index]
  availability_zone = "${var.region}${var.ava_zone[count.index]}"
  tags = {
    "Name" = "${var.name}-pri${var.ava_zone[count.index]}"
  }
}

# 5. 가용영역 a의 private DB subnet
resource "aws_subnet" "zero_priDB" {
  count             = length(var.pri_subdb)
  vpc_id            = aws_vpc.zero_vpc.id
  cidr_block        = var.pri_subdb[count.index]
  availability_zone = "${var.region}${var.ava_zone[count.index]}"
  tags = {
    "Name" = "${var.name}-priDB${var.ava_zone[count.index]}"
  }
}

