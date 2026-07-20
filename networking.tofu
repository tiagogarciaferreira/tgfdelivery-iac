resource "aws_vpc" "tgfdelivery_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name        = "${local.context_name}-vpc"
    Environment = var.environment
    ManagedBy   = local.managed_by
  }
}

resource "aws_subnet" "tgfdelivery_public" {
  for_each          = var.public_subnet_config
  vpc_id            = aws_vpc.tgfdelivery_vpc.id
  cidr_block        = each.value.cidr_block
  availability_zone = "${var.aws_region}${each.value.availability_zone}"
  tags = {
    Name        = "${local.context_name}-public-${each.value.availability_zone}"
    Environment = var.environment
    ManagedBy   = local.managed_by
  }
}

resource "aws_subnet" "tgfdelivery_private_management" {
  for_each          = var.private_management_subnet_config
  vpc_id            = aws_vpc.tgfdelivery_vpc.id
  cidr_block        = each.value.cidr_block
  availability_zone = "${var.aws_region}${each.value.availability_zone}"
  tags = {
    Name        = "${local.context_name}-private-management-${each.value.availability_zone}"
    Environment = var.environment
    ManagedBy   = local.managed_by
  }
}

resource "aws_subnet" "tgfdelivery_private_cluster" {
  for_each          = var.private_cluster_subnet_config
  vpc_id            = aws_vpc.tgfdelivery_vpc.id
  cidr_block        = each.value.cidr_block
  availability_zone = "${var.aws_region}${each.value.availability_zone}"
  tags = {
    Name        = "${local.context_name}-private-cluster-${each.value.availability_zone}"
    Environment = var.environment
    ManagedBy   = local.managed_by
  }
}

resource "aws_internet_gateway" "tgfdelivery_igw" {
  vpc_id = aws_vpc.tgfdelivery_vpc.id
  tags = {
    Name        = "${local.context_name}-igw"
    Environment = var.environment
    ManagedBy   = local.managed_by
  }
}

resource "aws_route_table" "tgfdelivery_public" {
  vpc_id = aws_vpc.tgfdelivery_vpc.id

  route {
    cidr_block = local.internet_cidr_block
    gateway_id = aws_internet_gateway.tgfdelivery_igw.id
  }

  tags = {
    Name        = "${local.context_name}-public-rt"
    Environment = var.environment
    ManagedBy   = local.managed_by
  }
}

resource "aws_route_table_association" "tgfdelivery_public_association" {
  for_each       = aws_subnet.tgfdelivery_public
  subnet_id      = each.value.id
  route_table_id = aws_route_table.tgfdelivery_public.id
}

resource "aws_nat_gateway" "tgfdelivery_nat" {
  vpc_id            = aws_vpc.tgfdelivery_vpc.id
  availability_mode = local.availability_mode
  tags = {
    Name        = "${local.context_name}-ngw"
    Environment = var.environment
    ManagedBy   = local.managed_by
  }
}

resource "aws_route_table" "tgfdelivery_private" {
  vpc_id = aws_vpc.tgfdelivery_vpc.id

  route {
    cidr_block = local.internet_cidr_block
    gateway_id = aws_nat_gateway.tgfdelivery_nat.id
    #nat_gateway_id = aws_nat_gateway.tgfdelivery_nat.id
  }

  tags = {
    Name        = "${local.context_name}-private-rt"
    Environment = var.environment
    ManagedBy   = local.managed_by
  }
}

resource "aws_route_table_association" "tgfdelivery_private_management_association" {
  for_each       = aws_subnet.tgfdelivery_private_management
  subnet_id      = each.value.id
  route_table_id = aws_route_table.tgfdelivery_private.id
}

resource "aws_route_table_association" "tgfdelivery_private_cluster_association" {
  for_each       = aws_subnet.tgfdelivery_private_cluster
  subnet_id      = each.value.id
  route_table_id = aws_route_table.tgfdelivery_private.id
}