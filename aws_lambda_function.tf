resource "aws_lambda_function" "start_stop_sm" {
  function_name = "StopStartSageMakerNotebookInstances"
  filename      = "${path.module}/src/lambda_function.zip"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  role          = aws_iam_role.lambda_exec.arn
  tags = {
    Name              = "StopStartSageMakerNotebookInstances"
    cost-center       = var.cost_center
    terraform_managed = true
  }
}
