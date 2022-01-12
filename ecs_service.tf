
# Creating service
resource "aws_ecs_service" "my_service" {
  name            = "node-ecs-service"
  cluster         = "${aws_ecs_cluster.my_cluster.id}"
  task_definition = "${aws_ecs_task_definition.mytask.arn}"
  launch_type     = "FARGATE"
  desired_count   = 1

  load_balancer {
    target_group_arn = "${aws_lb_target_group.target_group.arn}"
    container_name   = "${aws_ecs_task_definition.mytask.family}"
    container_port   = 8000  
  }

  network_configuration {
    subnets   = [
        "${aws_subnet.public[0].id}",
        "${aws_subnet.public[1].id}",
        "${aws_subnet.public[2].id}"
    ]
    assign_public_ip = true
    security_groups = ["${aws_security_group.ecs.id}"]
  }
}

