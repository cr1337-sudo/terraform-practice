provider "aws" {
    region = "us-east-1"
}

/*
Resources:
    Unidad básica de configuración en terraform, mínima expresión.
*/

resource "aws_instance" "nginx-server" {
    ami = "ami-0440d3b780d96b29d"
    instance_type = "t3.micro"
}