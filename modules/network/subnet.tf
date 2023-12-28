
resource "aws_subnet" "public-1a" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = cidrsubnet(var.vpc_cidr_block, 8, 0)
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    "kubernetes.io/role/elb" = 1
    Name                     = "public-subnet-1a"
  }
}

resource "aws_subnet" "public-1b" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = cidrsubnet(var.vpc_cidr_block, 8, 1)
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true

  tags = {
    "kubernetes.io/role/elb" = 1
    Name                     = "public-subnet-1b"
  }
}

resource "aws_subnet" "private-1a" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = cidrsubnet(var.vpc_cidr_block, 8, 2)
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = false

  tags = {
    "kubernetes.io/role/internal-elb" = 1
    Name                              = "private-subnet-1a"
  }
}

resource "aws_subnet" "private-1b" {
  vpc_id                  = aws_vpc.default.id
  cidr_block              = cidrsubnet(aws_vpc.default.cidr_block, 8, 3)
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = false

  tags = {
    "kubernetes.io/role/internal-elb" = 1
    Name                              = "private-subnet-1b"
  }
}
