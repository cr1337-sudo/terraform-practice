// SG
resource "aws_security_group" "nginx-server-sg" {
  name        = "nginx-server-sg"
  description = "Allows SSH and HTTP access"

  tags = {
    Name        = "${var.server_name}-sg"
    Environment = var.environment
    Owner       = "cristiancuello10@gmail.com"
    Team        = "DevOps"
    Project     = "Pruebas"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
}

