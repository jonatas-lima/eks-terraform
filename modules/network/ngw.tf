resource "aws_eip" "ngw-1a" {
  domain = "vpc"
}

resource "aws_eip" "ngw-1b" {
  domain = "vpc"
}

resource "aws_nat_gateway" "default-1a" {
  allocation_id = aws_eip.ngw-1a.id
  subnet_id     = aws_subnet.public-1a.id

  depends_on = [aws_internet_gateway.default]
}

resource "aws_nat_gateway" "default-1b" {
  allocation_id = aws_eip.ngw-1b.id
  subnet_id     = aws_subnet.public-1b.id

  depends_on = [aws_internet_gateway.default]
}
