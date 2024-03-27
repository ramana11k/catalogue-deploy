variable "common_tags" {
    default = {
        Project = "roboshop"
        Environment = "dev"
        Terraform = "true"
    }
}

# seperate tag
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
    default = "nikhildevops.online"  
}


variable "app_version" {
   default = "1.0.0"
}

variable "iam_instance_profile" {
  default = "ShellScriptRoleForRoboshop"
}