output "ecr_repo" {
  value = aws_ecr_repository.ecr_name.repository_url
}