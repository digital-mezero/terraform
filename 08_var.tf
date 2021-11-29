variable "region" {
    type = string 
    default = "ap-northeast-2"
}

variable "name" {
    type = string
    default = "zero"
}

variable "key" {
    type = string
    default = "zero_key"
}

variable "ava_zone" {
    type = list
    default = ["a", "c"]
}

variable "cidr_main" {
    type = string
    default = "10.0.0.0/16" 
}

variable "pub_sub" {
    type = list
    default = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "pri_sub" {
    default = ["10.0.2.0/24","10.0.3.0/24"]  
}

variable "pri_subdb" {
    default = ["10.0.4.0/24","10.0.5.0/24"]
}

variable "cidr_route" {
    type = string
    default = "0.0.0.0/0"
}

variable "cidr_routev6" {
    type = string
    default = "::/0"  
}

variable "ssh" {
    type = string
    default = "ssh"
}

variable "http" {
    type = string
    default = "http"
}

variable "icmp" {
    type = string
    default = "icmp"
}

variable "mysql" {
    type = string
    default = "mysql"
}

variable "port_ssh" {
    type = number
    default = 22
}

variable "port_http" {
    type = number
    default = 80
}

variable "port_mysql" {
    type = number
    default = 3306 
}

variable "port_zero" {
    type = number
    default = 0
}

variable "minus" {
    default = -1  
}

variable "pro_tcp" {
    type = string
    default = "tcp"
}

variable "pro_icmp" {
    type = string
    default = "icmp"
}

variable "pro_udp" {
    type = string
    default = "udp"
}

variable "nul" {
    default = null  
}

variable "port_all" {
    type = string
    default = "all"
}

variable "all_size" {
    default = 20
    type = number
}

variable "db_name" {
    type = string
    default = "mydb"
  
} 

variable "db_id" {
    type = string
    default = "admin"
}

variable "db_passwd" {
    default = "it12345!"
}

variable "db_class" {
    default = "db.t2.micro"
}

variable "parameter_group_name" {
    default = "default.mysql8.0"
}

variable "db_version" {
  default = "8.0"
}

variable "db_type" {
    default = "gp2"
}

variable "load_type" {
    default = "application"
}

variable "ec2_type" {
    default = "t2.micro"
}

variable "iam_role" {
    default = "admin_role"
}

variable "pg_strategy" {
    default = "cluster"
}

variable "HTTP" {
  type = string
  default = "HTTP"
}