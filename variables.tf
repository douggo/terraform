variable "amis" {
    type = "map"
    default = {
        "sa-east-1" = "ami-08af887b5731562d3"
        "us-east-1" = "ami-08af887b5731562d3"
    }
}

variable "cdirs_acesso_remoto" {
    type = "list"
    default = ["170.150.0.98/32","170.150.0.98/32"]
}

variable "key_name" {
  default = "terraform-aws"
}

variable "ec2_instance" {
  default = "t2.micro"
}