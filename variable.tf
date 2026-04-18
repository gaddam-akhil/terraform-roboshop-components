variable "project_name" {
    default = "roboshop"
}

variable "env" {
    default = "dev"
}

variable "component" {
  type        = string
}

variable "port_number" {
    default = "8080"
}

variable "health_check" {
    default = "/health"
}

variable "rule_priority" {
    type = string
}

variable "app_version" {
    default = "v3"
}

variable "domain_name" {
    default = "gaddam.online"
}