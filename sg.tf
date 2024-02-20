## Creates Security Group for public load balancer 
resource "aws_security_group" "alb_public" {
 count = var.ALB_INTERNAL ? 0 : 1   
 name        = "robo-${var.ENV}-alb-public-sg"
 description = "Allows alb-public inbound traffic"
 vpc_id      = data.terraform_remote_state.vpc.outputs.VPC_ID 
 
ingress {
   description = "Allows alb-public traffic"
   from_port   = 80
   to_port     = 80
   protocol    = "tcp"
   cidr_blocks = "0.0.0.0/0"
 }

egress {
   from_port   = 0
   to_port     = 0
   protocol    = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }

tags = {
    Name = "robo-${var.ENV}-alb-public-sg"
  }
}

## Creates Security Group for private load balancer 
resource "aws_security_group" "alb_private" {
 count = var.ALB_INTERNAL ? 1 : 0
 name        = "robo-${var.ENV}-alb-private-sg"
 description = "Allows alb-private inbound traffic"
 vpc_id      = data.terraform_remote_state.vpc.outputs.VPC_ID 
 
ingress {
   description = "Allows alb-private traffic"
   from_port   = 80
   to_port     = 80
   protocol    = "tcp"
   cidr_blocks = [data.terraform_remote_state.vpc.outputs.VPC_CIDR]
 }

egress {
   from_port   = 0
   to_port     = 0
   protocol    = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }

tags = {
    Name = "robo-${var.ENV}-alb-private-sg"
  }
}


