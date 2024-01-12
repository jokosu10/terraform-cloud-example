variable aws_access_key {
    type        = string
    default     = ""
    description = "AWS Access Key"
}

variable aws_secret_key {
    type        = string
    default     = ""
    description = "AWS Secret Key"
}

variable region {
    type        = string
    default     = "ap-southeast-1"
    description = "Default region from AWS"
}

variable avability_zone {
    type        = string
    default     = "ap-southeast-1a"
    description = "Default avability zone from AWS"
}

variable "vpc_cidr" {
    type = string
    description = "Range of vpc ip address"
}

variable "vpc_name" {
    type = string
    description = "Name of vpc"
}

variable "instance_type" {
    description = "EC2 instance type"
    type        = string
}

variable "instance_name" {
    description = "EC2 instance name"
    type        = string
}
