// ./terraform destroy -target aws_s3_bucket.dev2
resource "aws_s3_bucket" "dev2" {
    bucket = "tf-bucket-dev2"
    acl = "private"

    tags = {
      Name = "tf-bucket-dev4"
    }
}