resource "random_string" "name_suffix_s3" {
  length  = 6
  special = false
  upper   = false
}

locals {
  s3_bucket_name = "my-s3-bucket-${random_string.name_suffix_s3.result}"
}

resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = local.s3_bucket_name

  tags = {
    Name = local.s3_bucket_name
  }
}

resource "aws_s3_bucket_website_configuration" "my_s3_bucket_website" {
  bucket = aws_s3_bucket.my_s3_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "404.html"
  }
}

resource "aws_s3_bucket_public_access_block" "my_s3_bucket_pab" {
  bucket = aws_s3_bucket.my_s3_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "my_s3_bucket_policy" {
  bucket = aws_s3_bucket.my_s3_bucket.id
  policy = data.aws_iam_policy_document.my_custom_policy_document.json
}

data "aws_iam_policy_document" "my_custom_policy_document" {
  statement {
    sid = "PublicReadGetObject"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = ["s3:GetObject"]

    resources = ["${aws_s3_bucket.my_s3_bucket.arn}/*"]
  }
}
