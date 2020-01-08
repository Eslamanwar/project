
provider "aws" {
  region     = "${var.aws_region}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  version = "~> 2.8"
}

resource "aws_vpc" "vpc_app" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = "true"
  tags = {
    sre_candidate = "eslam_mohammed"
  }

}
