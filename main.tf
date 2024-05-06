// Vars
variable "ami_id" {
  description = "AMI ID for EC2 instance"
  default     = "ami-0440d3b780d96b29d"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  default     = "t2.micro"
}

variable "server_name" {
  description = "Server name"
  default     = "nginx-server"
}

variable "environment" {
  description = "App environment"
  default     = "test"
}

// Provider
provider "aws" {
  region     = "us-east-1"
}

// Nginx EC2 instance
resource "aws_instance" "nginx-server" {
  ami           = var.ami_id
  instance_type = var.instance_type

  user_data = <<-EOF
                #!/bin/bash
                sudo yum install -y nginx
                sudo systemctl enable nginx
                sudo systemctl start nginx
                EOF

  key_name = aws_key_pair.nginx-server-ssh.key_name
  vpc_security_group_ids = [
    aws_security_group.nginx-server-sg.id
  ]
  tags = {
    Name        = var.server_name
    Environment = var.environment
    Owner       = "cristiancuello10@gmail.com"
    Team        = "DevOps"
    Project     = "Pruebas"
  }
}
// Key pair
resource "aws_key_pair" "nginx-server-ssh" {
  key_name   = "${var.server_name}-ssh"
  public_key = file("${var.server_name}.key.pub")
  tags = {
    Name        = "${var.server_name}-ssh"
    Environment = var.environment
    Owner       = "cristiancuello10@gmail.com"
    Team        = "DevOps"
    Project     = "Pruebas"
  }
}

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

// Output
output "server_public_ip" {
  description = "Nginx EC2 Instance public IP"
  value       = aws_instance.nginx-server.public_ip
}

output "server_public_dns" {
  description = "Nginx EC2 Instance public IP"
  value       = aws_instance.nginx-server.public_dns
}
