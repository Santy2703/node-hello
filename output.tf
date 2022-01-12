output "aws_alb" {
    value = "${aws_alb.application_load_balancer.dns_name}"
}