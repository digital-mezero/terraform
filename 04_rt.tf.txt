resource "aws_route_table" "zero_rt"{
    vpc_id = aws_vpc.zero_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.zero_ig.id
    }

    tags = {
        "Name" = "zero-rt"
    }
}