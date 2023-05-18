resource "aws_lambda_function" "lambda" {
  function_name = "hello_lambda"
  #role    = "${aws_iam_role.iam_for_lambda.arn}"
  handler = "hello_lambda.lambda_handler"
  runtime = "python3.6"
}  
