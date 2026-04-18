locals {
  ami_id = data.aws_ami.amidevops.id
  sg_id = data.aws_ssm_parameter.sg_id.value
  private_subnet_id = split(",",data.aws_ssm_parameter.private_subnet_ids.value)[0]
  health_check_path = var.component == "frontend" ? "/" : "/health"
  port_number = var.component == "frontend" ? 80 : 8080
  frontend_alb_listener_arn = data.aws_ssm_parameter.frontend_alb_listener_arn.value
  backend_alb_listener_arn = data.aws_ssm_parameter.backend_alb_listener_arn.value  
  alb_listener_arn = var.component == "frontend" ? local.frontend_alb_listener_arn : local.backend_alb_listener_arn
  host_header = var.component == "frontend" ? "${var.component}-${var.env}.${var.domain_name}" : "${var.component}.backend_alb-${var.env}.${var.domain_name}"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  common_tags = {
    Project = var.project_name
    Environment = var.env
    Terraform = "true"
    Description = "tags for catalogue instance"
  }
}
