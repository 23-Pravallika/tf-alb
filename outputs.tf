output "ALB_ARN"{
    value = aws_lb.alb.arn
}

output "APP_LISTENER"{
    value = aws_lb_listener.private.APP_LISTENER
}

