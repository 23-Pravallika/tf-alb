#creates application load balancer
resource "aws_lb" "alb" {
  name               = var.ALB_NAME
  internal           = var.ALB_INTERNAL
  load_balancer_type = "application"
  security_groups    = var.ALB_INTERNAL ? aws_security_group.alb_private.*.id : aws_security_group.alb_public.*.id
  subnets            = var.ALB_INTERNAL ? data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_ID : data.terraform_remote_state.vpc.outputs.PUBLIC_SUBNET_ID

  
  tags = {
    Name = var.ALB_NAME
  }
}


