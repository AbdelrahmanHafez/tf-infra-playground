module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "generate-random-person"
  description   = "Generates a random person information"
  handler       = "index.handler"
  runtime       = "nodejs22.x"

  source_path = "./placeholder-lambda/index.js"
}
