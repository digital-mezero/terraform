resource "aws_route_table" "zero_ngwrt"{
    vpc_id = aws_vpc.zero_vpc.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id =  aws_nat_gateway.zero_ngw.id
    }
    tags = {
        "Name" = "zero-ngwrt"
    }
}