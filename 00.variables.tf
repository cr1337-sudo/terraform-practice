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
