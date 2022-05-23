provider "aws" {
  region              = "region"
  allowed_account_ids = [local.account_id]
}
