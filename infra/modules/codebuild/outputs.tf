output "name" {
  description = "The name of the CodeBuild project"
  value       = aws_codebuild_project.cb_project.name
}