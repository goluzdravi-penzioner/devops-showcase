provider "aws" {
  region = "eu-west-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-state-devopbg"
    key    = "terraform-state"
    region = "eu-west-1"
    #dynamodb_table = "terraform-state-lock-dynamo"
  }
}

# # dynamodb table for locking the state file
# resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
#   name = "terraform-state-lock-dynamo"
#   hash_key = "LockID"
#   read_capacity = 20
#   write_capacity = 20
 
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
 
#   tags {
#     Name = "DynamoDB Terraform State Lock Table"
#   }
# }