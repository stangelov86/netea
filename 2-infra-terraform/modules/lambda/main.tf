data "archive_file" "lambda" {
  type        = "zip"
  source_file = "${path.module}/index.js"
  output_path = "${path.module}/lambda_function.zip"
}

resource "aws_lambda_function" "this" {
  function_name = "devops_task_lambda"
  runtime       = var.runtime
  handler       = "index.handler"
  role          = aws_iam_role.lambda_exec.arn
  filename      = "${path.module}/lambda_function.zip"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  environment {
    variables = var.environment_variables
  }

  tags = {
    Environment = var.environment
  }
}

resource "aws_iam_role" "lambda_exec" {
  name               = "lambda_exec_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json

  tags = {
    Environment = var.environment
  }
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "lambda_exec_attach" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_permission" "this" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.arn
  principal     = "apigateway.amazonaws.com"

  source_arn = "${var.api_execution_arn}/*/*"
}