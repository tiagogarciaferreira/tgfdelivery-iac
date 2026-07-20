resource "aws_vpc" "tgfdelivery_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name        = "${local.context_name}-vpc"
    Environment = var.environment
  }
}

resource "aws_subnet" "public" {
  for_each          = var.public_subnet_config
  vpc_id            = aws_vpc.tgfdelivery_vpc.id
  cidr_block        = each.value.cidr_block
  availability_zone = "${var.aws_region}${each.value.availability_zone}"
  tags = {
    Name        = "${local.context_name}-public-${each.value.availability_zone}"
    Environment = var.environment
  }
}

resource "aws_internet_gateway" "tgfdelivery_igw" {
  vpc_id = aws_vpc.tgfdelivery_vpc.id

  tags = {
    Name        = "${local.context_name}-igw"
    Environment = var.environment
  }
}
