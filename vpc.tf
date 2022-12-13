module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"


  name = "my-vpc"
  cidr = "172.21.0.0/16"

  azs             = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  private_subnets = ["172.21.1.0/24", "172.21.2.0/24", "172.21.3.0/24"]
  public_subnets  = ["172.21.101.0/24", "172.21.102.0/24", "172.21.103.0/24"]

  enable_ipv6 = true

  enable_nat_gateway = false
  single_nat_gateway = true

  public_subnet_tags = {
    Name = "overridden-name-public"
  }

  vpc_tags = {
    Name = "my-vpc"
  }
}