output "s3_bucket_arn" {
  value = module.terraform_state.s3_bucket_arn
}

output "dynamodb_table_name" {
  value = module.terraform_state.dynamodb_table_name
}
