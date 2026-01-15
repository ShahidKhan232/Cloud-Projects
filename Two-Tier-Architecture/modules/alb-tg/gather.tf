data "aws_subnet" "public-subnet1" {
  filter {
    name   = "tag:Name"
    values = [var.public-subnet-name1]
  }
}

data "aws_subnet" "public-subnet2" {
  filter {
    name   = "tag:Name"
    values = [var.public-subnet-name2]
  }
}

data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc-name]
  }
}