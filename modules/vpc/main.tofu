resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = merge(var.common_tags, {
    Name = var.vpc_name
  })
}

resource "aws_subnet" "public" {
  for_each          = local.merged_public_subnets
  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr_block
  availability_zone = "${var.aws_region}${each.value.availability_zone}"

  tags = merge(var.common_tags, {
    Name = "${var.context_name}-public-${each.value.group}-${each.value.availability_zone}"
  })
}

resource "aws_subnet" "private" {
  for_each          = local.merged_private_subnets
  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr_block
  availability_zone = "${var.aws_region}${each.value.availability_zone}"

  tags = merge(var.common_tags, {
    Name = "${var.context_name}-private-${each.value.group}-${each.value.availability_zone}"
  })
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge(var.common_tags, {
    Name = "${var.context_name}-igw"
  })
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = local.internet_cidr_block
    gateway_id = aws_internet_gateway.main.id
  }

  tags = merge(var.common_tags, {
    Name = "${var.context_name}-public-rt"
  })
}

resource "aws_route_table_association" "public" {
  for_each       = aws_subnet.public
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

resource "aws_nat_gateway" "main" {
  vpc_id            = aws_vpc.main.id
  availability_mode = var.nat_gateway_availability_mode

  tags = merge(var.common_tags, {
    Name = "${var.context_name}-ngw"
  })
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = local.internet_cidr_block
    nat_gateway_id = aws_nat_gateway.main.id
  }

  tags = merge(var.common_tags, {
    Name = "${var.context_name}-private-rt"
  })
}

resource "aws_route_table_association" "private" {
  for_each       = aws_subnet.private
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private.id
}