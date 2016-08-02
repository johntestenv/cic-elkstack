output "cic-elkstack-elb" {
  value = "${aws_elb.elb.dns_name}"
}
