resource "aws_lb_target_group" "target_group" {
  name     = "target_group"
  port     = var.alb_listener_port
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path     = "/"
    protocol = "HTTP"
    port     = var.alb_listener_port
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.main.arn
  port              = 443
  protocol          = "HTTPS"

  default_action {
    target_group_arn = aws_lb_target_group.target_group.arn
    type             = "forward"
  }
}

resource "aws_lb" "main" {
  name               = "main_alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = aws_subnet.subnets[*].id

  security_groups = [aws_security_group.alb_sg.id]

  tags = {
    Name = "main_alb"
  }
}

