terraform {
  backend "s3" {
    bucket = "bucket-name"
    key    = "file-key"
    region = "us-east-2"
  }
}

// Modules

// Modulo 1
module "nginx_server_dev" {
  source = "./nginx_server_module"

  ami_id        = "ami-0ddda618e961f2270"
  instance_type = "t2.micro"
  server_name   = "nginx-server-dev"
  environment   = "dev"
}

// Modulo 2
# module "nginx_server_prod" {
#   source = "./nginx_server_module"

#   ami_id        = "ami-0ddda618e961f2270"
#   instance_type = "t2.micro"
#   server_name   = "nginx-server-prod"
#   environment   = "production"
# }


provider "aws" {
  region = "us-east-2"
}

// Output
output "nginx_dev_ip" {
  description = "Nginx EC2 Instance public IP"
  value       = module.nginx_server_dev.server_public_ip
}

output "nginx_dev_dns" {
  description = "Nginx EC2 Instance public IP"
  value       = module.nginx_server_dev.server_public_dns
}

