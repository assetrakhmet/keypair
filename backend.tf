terraform {
  backend "s3" {
    bucket = "asset-test-my-bucket1"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}
