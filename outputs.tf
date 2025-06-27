output "lambda_function_name" {
  description = "Name of the deployed Lambda function"
  value       = aws_lambda_function.my_lambda.function_name
}

output "lambda_function_arn" {
  description = "ARN of the deployed Lambda function"
  value       = aws_lambda_function.my_lambda.arn
}

output "lambda_layer_arn" {
  description = "ARN of the Lambda Layer version"
  value       = aws_lambda_layer_version.lambda_layer.arn
}

output "lambda_layer_version" {
  description = "Layer version"
  value       = aws_lambda_layer_version.lambda_layer.version
}

output "lambda_role_arn" {
  description = "IAM Role ARN used by Lambda"
  value       = aws_iam_role.lambda_exec.arn
}
