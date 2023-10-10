resource "aws_elastic_beanstalk_environment" "frontend" {
  name                = "frontend-env"
  application         = "uniamerica-prod"
  solution_stack_name = "64bit Amazon Linux 2 v5.2.2 running Node.js"
  # Outros parâmetros como variáveis de ambiente e configurações

  # Conectar este ambiente a um load balancer
  setting {
    namespace = "aws:elbv2:listener:80"
    name      = "DefaultProcess"
    value     = "frontend-lb-target-group"
  }

  # Grupos de segurança
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SecurityGroups"
    value     = "sg-frontend"
  }
}

resource "aws_lb" "frontend" {
  name               = "frontend-lb"
  load_balancer_type = "application"
  subnets            = [aws_subnet.frontend.id]
  enable_deletion_protection = false
}

resource "aws_security_group" "sg-frontend" {
  name        = "frontend-sg"
  description = "Security group for frontend app"
  # Regras de segurança
}