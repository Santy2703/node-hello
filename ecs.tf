
# Cluster creation
resource "aws_ecs_cluster" "my_cluster" {
  name = "node-cluster" 
}

resource "aws_security_group" "ecs" {
  name   = "node-ecs-sg"
  vpc_id = aws_vpc.this.id

  ingress {
    from_port       = 0
    protocol        = "tcp"
    to_port         = 65535
    security_groups = [aws_security_group.load_balancer_security_group.id]

  }
  ingress {
    from_port       = 8000
    protocol        = "tcp"
    to_port         = 8000
    security_groups = [aws_security_group.load_balancer_security_group.id]

  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}



