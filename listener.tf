resource "aws_lb_listener" "private" {
  count             =  var.ALB_INTERNAL ? 1 : 0
  load_balancer_arn = data.terraform_remote_state.alb-private.PRIVATE_ALB_ARN
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
}





