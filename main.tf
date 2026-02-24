resource "aws_vpc" "aircanada_vpc" {
  cidr_block = var.vpc_cidr_block
  instance_tenancy = var.instance_tenancy
  tags = var.vpc_tags
}

#Creating the IGW
resource "aws_internet_gateway" "aircanada_igw" {
  vpc_id = aws_vpc.aircanada_vpc.id
  tags   = var.vpc_tags
}

resource "aws_subnet" "AC_Public" {
  vpc_id            = aws_vpc.aircanada_vpc.id
  cidr_block        = var.publicSN_cidr_block
  availability_zone = "us-east-1a"
  tags              = {
    Name        = "AC_Public_Subnet"
    Env = "Prod"
  }
}

resource "aws_subnet" "AC_Private" {
  vpc_id            = aws_vpc.aircanada_vpc.id
  cidr_block        = var.privateSN_cidr_block
  availability_zone = "us-east-1a"
  tags              = {
    Name        = "AC_Private_Subnet"
    Env = "Prod"
  }
}

resource "aws_route_table" "AC_Public_RT" {
  vpc_id = aws_vpc.aircanada_vpc.id

  route {
    cidr_block = var.pubrt_cidrblock
    gateway_id = aws_internet_gateway.aircanada_igw.id
  }

  tags   = {
    Name = "PublicSN_RT"
    Env = "Prod"
  }
}

resource "aws_route_table" "AC_Private_RT" {
  vpc_id = aws_vpc.aircanada_vpc.id

  route {
    cidr_block = var.privatert_cidrblock
    nat_gateway_id = aws_nat_gateway.aircanada_ngw.id
  }

  tags   = {
    Name = "PrivateSN_RT"
    Env = "Prod"
  }
}

resource "aws_nat_gateway" "aircanada_ngw" {
  allocation_id = aws_eip.aircanada_eip.id
  subnet_id    = aws_subnet.AC_Public.id
  tags = {
    Name = "AC_NAT_Gateway"
    Env  = "Prod"
  }
  # To ensure proper ordering, it is recommended to add an explicit dependency
  depends_on = [aws_internet_gateway.aircanada_igw, aws_eip.aircanada_eip]  
}
resource "aws_eip" "aircanada_eip" {
}

resource "aws_route_table_association" "AC_Public_RTA" {
  subnet_id      = aws_subnet.AC_Public.id
  route_table_id = aws_route_table.AC_Public_RT.id
}

resource "aws_route_table_association" "AC_Private_RTA" {
  subnet_id      = aws_subnet.AC_Private.id
  route_table_id = aws_route_table.AC_Private_RT.id
}