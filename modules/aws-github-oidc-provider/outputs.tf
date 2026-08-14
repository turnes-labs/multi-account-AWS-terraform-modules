output "github_provider_arn" {
  value = aws_iam_openid_connect_provider.github.arn
}

output "github_provider_url" {
  value = aws_iam_openid_connect_provider.github.url
}
