output "ecr_repository" {
  value = aws_ecr_repository.this
  description = "The AWS ECR Repository resource"
}

output "repository_url" {
  value = aws_ecr_repository.this.repository_url
  description = "ECR repository URL"
}

output "image_hash" {
  value = local.hash
  description = "Hash of the image source code, applied as a tag to the container image"
}

output "image_uri" {
  value = "${aws_ecr_repository.this.repository_url}:${local.hash}"
  description = "Image URI"
}
