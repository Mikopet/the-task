variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr_blocks" {
  default = ["10.0.1.0/24", "10.2.0.0/24"]
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  default = "ami-12345678"
}

variable "alb_listener_port" {
  default = 80
}

