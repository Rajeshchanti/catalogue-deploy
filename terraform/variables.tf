variable "common_tags" {
  type = map 
  default = {
    Project = "roboshop"
    Environment = "dev"
    Terraform = "true"
  }
}
variable "tags" {
    default = {
        component = "catalogue"
    }  
}
variable "project_name" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "zone_name" {
  default = "techytrees.online"
}
variable "app_version" {
  
}
variable "iam_instance_profile" {
  default = "project_role"
}