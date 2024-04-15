resource "aws_dynamodb_table" "dynamodb_homologacao" {
    provider = "aws.aws-us"
    name = "GameScores"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "UserId"
    range_key = "GameTitle"

    attribute {
      name = "UserId"
      type = "S"
    }

    attribute {
      name = "GameTitle"
      type = "S"
    }
}