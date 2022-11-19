data "aws_vpc" "self" {

    default = "vpc-01e8efd208d21a701"

    cidr_block = "13.0.0.0/16"
    tags = {
       Name = "dev"
       resource = "vpc"
    }
}

data "aws_subnet" "frontend" {
    vpc_id = aws_vpc.self.id 
    cidr_block = "13.0.1.0/24"
    availability_zone = format("%s%s",var.region,"a")
    tags = {
        name = "frontend"
        Environment = "development"
    }
}

resource "aws_subnet" "backend" {
    vpc_id = aws_vpc.self.id
    cidr_block = "13.0.2.0/24"
    availability_zone = format("%s%s","us-east-1","b")
    tags = {
        name = "backend"
        Environment = "development"
    }
}

resource "aws_subnet" "mgt" {
    vpc_id = aws_vpc.self.id
    cidr_block = "13.0.3.0/24"
    availability_zone = format("%s%s","us-east-1","c")
    tags = {
        name = "mgt"
        Environment = "dev"
    }
}

resource aws_subnet "db" {
    cidr_block = "13.0.4.0/24"
    vpc_id = aws_vpc.self.id
    availability_zone = format("%s%s","us-east-1","d")
    tags = {
        Environment = "dev"
        name = "db"
    }
}