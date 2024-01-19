terraform {
  backend "s3" {
    bucket = "asset-test-my-bucket"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}
