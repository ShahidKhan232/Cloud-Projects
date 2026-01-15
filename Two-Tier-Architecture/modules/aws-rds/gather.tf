data "aws_subnet" "private-subnet1" {
  filter {
    name   = "tag:Name"
    values = [var.private-subnet-name1]
  }
}

data "aws_subnet" "private-subnet2" {
  filter {
    name   = "tag:Name"
    values = [var.private-subnet-name2]
  }
}

data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc-name]
  }
}