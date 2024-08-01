resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "eks-igw"
  }
}

resource "aws_nat_gateway" "ngw" {
  depends_on = [ aws_internet_gateway.igw ]
  for_each = var.subnet_numbers

  allocation_id = aws_eip.nat-gw[each.key].id
  subnet_id = aws_subnet.public_subnets[each.key].id

  tags = {
    Name = "NATGW-${each.key}"
  }
}

resource "aws_eip" "nat-gw" {
  depends_on = [ aws_internet_gateway.igw ]

  for_each = var.subnet_numbers
  tags = {
    Name = "EIP-NATGW-${each.key}"
  
  }
  vpc      = true
}

resource "aws_route_table" "public_subnets" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public_subnets_rt"
  }
}

resource "aws_route_table" "private_subnets" {
  for_each = var.subnet_numbers

  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw[each.key].id
  }

  tags = {
    Name = "private_subnets_rt"
  }
}

resource "aws_route_table_association" "public_rt" {

  route_table_id = aws_route_table.public_subnets.id
  for_each = var.subnet_numbers
  subnet_id = aws_subnet.public_subnets[each.key].id 
  }

resource "aws_route_table_association" "private_rt" {
  for_each = var.subnet_numbers

  route_table_id = aws_route_table.private_subnets[each.key].id
  subnet_id = aws_subnet.private_subnets[each.key].id 
  }

