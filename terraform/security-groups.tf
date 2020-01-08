resource "aws_security_group" "app-web" {
  name        = "${var.app_name}"
  description = "${var.app_name}-app-web"
  vpc_id      = "${aws_vpc.vpc_app.id}"

  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["${aws_vpc.vpc_app.cidr_block}"]
  }

  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = ["${aws_vpc.vpc_app.cidr_block}"]
  }

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["${aws_vpc.vpc_app.cidr_block}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    sre_candidate = "eslam_mohammed"
  }
}

resource "aws_security_group" "elb_web" {
  name        = "${var.app_name}-elb"
  description = "${var.app_name}-elb"
  vpc_id      = "${aws_vpc.vpc_app.id}"

  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    sre_candidate = "eslam_mohammed"
  }

}

resource "aws_security_group" "bastion-sg" {
  name        = "${var.app_name}-bastion"
  description = "${var.app_name}-bastion"
  vpc_id      = "${aws_vpc.vpc_app.id}"

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    sre_candidate = "eslam_mohammed"
  }
}
