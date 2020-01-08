resource "aws_key_pair" "bastion_key" {
  key_name   = "key_name"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQConRgqv/l7cz907MTNdFb/TsdhjiB9DbVruYupY9t595+8JSgNNiBzIB3SWlom1VWeInwlBgQJnGvT1nGXkLEXLrT4ekKOh1K56+9W3ciC9D6ZRSdlRaJFMHwW1iBebbEuwJ58nStVZltP9FtLkfrc2XVNx/3Ca5jjknsvFf6pPgFEDeKDqAG9SNlK5iRIXPxO5aGONjfqM+PslGONTNH+oc6X8xzBHccmDzM/pVXcgbZCRmdTystRVCPGeMQ9l5ztalDUPslXpe5gKhaB/dIMi0C7vnLfwubVsjRyMsETY7bYGb7T6VlR21XfjyWjFBQU/G+eAYKiymt9hogUxtLr admin-eslam@IT-LL009"
}


resource "aws_network_interface" "ni" {
  subnet_id   = "${aws_subnet.public_az1.id}"
  security_groups             = ["${aws_security_group.bastion-sg.id}"]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "bastion" {
  ami                         = "${data.aws_ami.ubuntu_ami.id}"
  key_name                    = "${aws_key_pair.bastion_key.key_name}"
  instance_type               = "t2.micro"

  network_interface {
    network_interface_id = "${aws_network_interface.ni.id}"
    device_index         = 0
  }
}


