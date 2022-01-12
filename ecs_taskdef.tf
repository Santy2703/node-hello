data "aws_caller_identity" "current" {}

data "template_file" "task_template_parameterstore" {
  template = file("./task-defn.json")

  vars = {
  account_id        = data.aws_caller_identity.current.account_id
  region            = "ap-southeast-1"
  }
}

# Task creation
resource "aws_ecs_task_definition" "mytask" {
  family = "nodecontainer"
  container_definitions = data.template_file.task_template_parameterstore.rendered
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  memory                   = 512
  cpu                      = 256
  execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn
}

