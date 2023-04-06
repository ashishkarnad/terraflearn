data "aws_region" "default" {
        id = format("%s", var.region[0])
}

data "aws_vpc" "default" {
        id = var.vpc_id

        }

resource "aws_subnet" "test" {
    vpc_id = data.aws_vpc.default.id
    cidr_block = cidrsubnet("172.31.0.0/16",4,6)
}