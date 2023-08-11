terraform {
  backend "s3" {
    bucket         = "testqtreedata4" // update terraform remote state bucket name
    key            = "terraform.tfstate" 
    region         = "us-east-1"
  }
}
provider "aws" {
  region = "us-east-1"
  access_key = "AKIARXM45NH26CHNOWEE"   //update your keys
  secret_key = "cCk3dWshNoVhGArAlAD/cEHp5d0qH4eMp3yAHIym" //update your keys
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "testqtreedata4456"     //update your unique bucket name          
  tags = {
    Name = "MyExampleBucket"
  }example_bucket
}
resource "aws_s3_bucket_versioning" "example_bucket" {
  bucket = aws_s3_bucket.example_bucket.bucket
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "example_bucket_lifecycle" {
  rule {
    id      = "example_rule"
    status  = "Enabled"
    transition {
      days          = 30
      storage_class = "GLACIER"
    }
    expiration {
      days = 365
    }
  }
  bucket = aws_s3_bucket.example_bucket.bucket
  depends_on = [aws_s3_bucket.example_bucket]
}

