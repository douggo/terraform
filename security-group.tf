resource "aws_security_group" "acesso-ssh-brazil" {
    name = "acesso-ssh"
    description = "acesso-ssh"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = var.cdirs_acesso_remoto
    }

    tags = {
        Name = "ssh"
    }
}

resource "aws_security_group" "acesso-ssh-us" {
    provider = "aws.aws-us"
    name = "acesso-ssh"
    description = "acesso-ssh"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = var.cdirs_acesso_remoto
    }

    tags = {
        Name = "ssh"
    }
}