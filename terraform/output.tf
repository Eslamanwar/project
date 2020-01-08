

output "elb_address" {
  value = "${aws_elb.elb_app.dns_name}"
}

output "bastion_public_ip" {
  value = "${aws_instance.bastion.public_ip}"
}


