# Configure the AWS provider
provider "aws" {
  region = "us-east-1"
}

# Create the VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main-vpc"
  }
}

# Create two public subnets
resource "aws_subnet" "public" {
  count       = 2
  vpc_id      = aws_vpc.main.id
  cidr_block  = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index)
  availability_zone = "us-east-1a"

  tags = {
    Name = "public-${count.index + 1}"
  }
}

# Create two private subnets
resource "aws_subnet" "private" {
  count       = 2
  vpc_id      = aws_vpc.main.id
  cidr_block  = cidrsubnet(aws_vpc.main.cidr_block, 8, count.index + 2)
  availability_zone = "us-east-1a"

  tags = {
    Name = "private-${count.index + 1}"
  }
}

# Create the users
resource "aws_iam_user" "user" {
  count = 2
  name  = "${count.index == 0 ? "pete-locke" : "tim-grimly"}"
}

# Create the servers
resource "aws_instance" "server" {
  count       = 2
  ami         = "ami-0ff8a91507f77f867"
  instance_type = "t2.micro"
  key_name      = "mykey"
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id            = element(aws_subnet.public.*.id, count.index)

  tags = {
    Name = "server-${count.index + 1}"
  }
}

# Create a security group for the servers
resource "aws_security_group" "sg" {
  name        = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
