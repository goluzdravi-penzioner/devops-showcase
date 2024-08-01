resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  tags = {
    Name = "EKS-1"
  }
}

resource "aws_subnet" "private_subnets" {
  for_each = var.subnet_numbers

  vpc_id            = aws_vpc.main.id
  availability_zone = each.key
  cidr_block        = cidrsubnet(var.cidr_private_subnets, 4, each.value)

  tags = {
    Name = "private-${each.value}-${each.key}"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

resource "aws_subnet" "public_subnets" {
  for_each = var.subnet_numbers

  vpc_id            = aws_vpc.main.id
  availability_zone = each.key
  cidr_block        = cidrsubnet(var.cidr_public_subnets, 4, each.value)

  tags = {
    Name = "public-${each.value}-${each.key}"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

