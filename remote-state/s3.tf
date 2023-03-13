resource "aws_s3_bucket" "s3-remote-state" {

    bucket = "fermino-s3-remote-state"

    tags = {
        project = "remote-state"
    }
}


resource  "aws_s3_bucket_versioning" "s3-remote-state" {
    bucket = aws_s3_bucket.s3-remote-state.id
    versioning_configuration {
      status = "Enabled"
    }
}