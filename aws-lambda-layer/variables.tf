variable "aws_region" {
  description = "AWS Region"
  default     = "eu-north-1"
}

variable "layer_name" {
  description = "Name of the Lambda layer"
  default     = "aws-utils-layer"
}

variable "layer_zip_file" {
  description = "Zipped layer file"
  default     = "my_utils.zip"
}

variable "lambda_name" {
  description = "Lambda function name"
  default     = "aws-lambda-layers"
}

variable "lambda_zip_file" {
  description = "Lambda function zip file"
  default     = "lambda_function.zip"
}
