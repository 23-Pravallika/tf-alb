output "ALB_ARN"{
    value = aws_lb.alb.arn
}

output "PUBLIC_ALB_INTERNAL" {
    value = aws_lb.alb.ALB_INTERNAL
}

output "PRIVATE_ALB_INTERNAL" {
    value = aws_lb.alb.ALB_INTERNAL
}


