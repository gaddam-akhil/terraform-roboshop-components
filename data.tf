data "aws_ami" "amidevops" {
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ssm_parameter" "sg_id" {
  name = "/${var.project_name}/${var.env}/${var.component}_sg_id" 
  }

data "aws_ssm_parameter" "private_subnet_ids" {
  name   = "/${var.project_name}/${var.env}/private_subnet_id"
  }

data "aws_ssm_parameter" "backend_alb_listener_arn" {
  name   = "/${var.project_name}/${var.env}/backend_alb_listener_arn"
  }  

data "aws_ssm_parameter" "frontend_alb_listener_arn" {
  name   = "/${var.project_name}/${var.env}/frontend_alb_listener_arn"
  }