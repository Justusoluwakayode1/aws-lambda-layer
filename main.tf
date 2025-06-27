provider "aws" {
  region = var.aws_region
}

resource "aws_lambda_layer_version" "lambda_layer" {
  layer_name          = var.layer_name
  compatible_runtimes = ["python3.12"]
  filename            = "${path.module}/layers/${var.layer_zip_file}"
  source_code_hash    = filebase64sha256("${path.module}/layers/${var.layer_zip_file}")
}

resource "aws_lambda_function" "my_lambda" {
  function_name = var.lambda_name
  filename      = "${path.module}/lambda_functions/${var.lambda_zip_file}"
  handler       = "handler.lambda_handler"
  runtime       = "python3.12"
  role          = aws_iam_role.lambda_exec.arn
  layers        = [aws_lambda_layer_version.lambda_layer.arn]
}

resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role_judejudex"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}


