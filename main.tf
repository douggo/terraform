provider "aws" {
  region = "sa-east-1"
  version = "~> 2.0"
}

provider "aws" {
  region = "us-east-1"
  alias = "aws-us"
  version = "~> 2.0"
}

// Criação de máquinas para desenvolvimento e armazenamento de buckets
resource "aws_instance" "dev" {
  count = 2
  ami = var.amis["sa-east-1"]
  instance_type = var.ec2_instance
  key_name = var.key_name
  tags = {
    Name = "dev${count.index}"
  }
  vpc_security_group_ids = [
    "${aws_security_group.acesso-ssh-brazil.id}"
  ]
}

resource "aws_instance" "dev2" {
  ami = var.amis["sa-east-1"]
  instance_type = var.ec2_instance
  key_name = var.key_name
  tags = {
    Name = "dev2"
  }
  vpc_security_group_ids = [
    "${aws_security_group.acesso-ssh-brazil.id}"
  ]
  depends_on = ["aws_s3_bucket.dev2"]
}

resource "aws_instance" "dev3" {
  provider = "aws.aws-us"
  ami = var.amis["us-east-1"]
  instance_type = var.key_name
  key_name = var.ec2_instance
  tags = {
    Name = "dev3"
  }
  vpc_security_group_ids = [
    "${aws_security_group.acesso-ssh-us.id}"
  ]
  depends_on = ["aws_dynamodb_table.dynamodb_homologacao"]
}