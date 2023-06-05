provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "alb_sg" {
  name        = "alb_sg"
  description = "ALB security group"

  ingress {
    from_port   = 80
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "ec2_sg" {
  name        = "ec2_sg"
  description = "EC2 security group"

  ingress {
    from_port       = var.alb_listener_port
    to_port         = var.alb_listener_port
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }
}

resource "aws_instance" "ec2_instances" {
  count                  = length(var.subnet_cidr_blocks)
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.subnets[count.index].id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
}

