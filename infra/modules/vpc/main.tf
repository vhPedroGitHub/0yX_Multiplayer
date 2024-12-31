#----------------------------
# VPC(VIRTUAL PRIVATE CLOUD)|
#----------------------------
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = merge(
    var.tags,
    {
      Name = "${var.name}"
    },
  )
}

#-------------------
#  INTERNET GATEWAY|
#-------------------
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
      var.tags,
      {
        Name = "${var.name}-InternetGateway"
      },
  )
}

#---------------------------
# CREATION OF PRIVATE SUBNETS|
#---------------------------
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.vpc.id
  count             = length(var.private_subnet_cidr)
  cidr_block        = var.private_subnet_cidr[count.index]
  availability_zone = var.azs[count.index]
  
  tags = merge(
    var.tags,
    {
      Name = "${var.name}-PrivateSubnet-${count.index}"
    },
  )
}

#--------------------------
# CREATION OF PUBLIC SUBNETS|
#--------------------------
resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.vpc.id
  count             = length(var.public_subnet_cidr)
  cidr_block        = var.public_subnet_cidr[count.index]
  availability_zone = var.azs[count.index]
  tags = merge(
    var.tags,
    {
      Name = "${var.name}-PublicSubnet-${count.index}"
    },
  )
}

#----------------------
# NAT GATEWAY WITH EIP|
#----------------------
// aws_eip 
resource "aws_eip" "nat_eip" {
  tags = merge(
    var.tags,
    {
      Name = "${var.name}-ElasticIP"
    },
  )
}

resource "aws_nat_gateway" "my_nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet[0].id
  depends_on    = [aws_internet_gateway.igw]
  tags = merge(
    var.tags,
    {
      Name = "${var.name}-NatGateway"
    },
  )
}

#---------------------
# PRIVATE ROUTE TABLE|
#---------------------
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my_nat.id
  }
  tags = merge(
    var.tags,
    {
      Name = "${var.name}-PrivateRouteTable"
    },
  )
}

#--------------------
# PUBLIC ROUTE TABLE|
#--------------------
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = merge(
    var.tags,
    {
      Name = "${var.name}-PublicRouteTable"
    },
  )
}

#---------------------------------------------------
# ASSOCIATE PRIVATE ROUTE TABLE WITH PRIVATE SUBNET|
#---------------------------------------------------
resource "aws_route_table_association" "private_route_table_association" {
  count          = length(var.private_subnet_cidr)
  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = aws_route_table.private_route_table.id
}

#---------------------------------------------------
# ASSOCIATE PUBLIC ROUTE TABLE WITH PUBLIC SUBNET|
#---------------------------------------------------
resource "aws_route_table_association" "public_route_table_association" {
  count          = length(var.public_subnet_cidr)
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = aws_route_table.public_route_table.id
}
