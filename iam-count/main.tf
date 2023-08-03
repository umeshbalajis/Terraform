provider "aws" {
  region = "us-east-1"
  access_key = "AKIARXM45NH26CHNOWEE"
  secret_key = "cCk3dWshNoVhGArAlAD/cEHp5d0qH4eMp3yAHIym"
}

#This block will create individual user as mentioned in the variables
resource "aws_iam_user" "example" {
  count = length(var.user_names)
  name  = var.user_names[count.index]
}
#this block will create user like neo.1, neo.2, neo.3
/*resource "aws_iam_user" "example" {
  count = 3
  name  = "neo.${count.index}"
}*/

#Print first array user i.e 1st user Arn alone
output "first_arn" {
  value       = aws_iam_user.example[0].arn
  description = "The ARN for the first user"
}
#Print all user ARN
output "all_arns" {
  value       = aws_iam_user.example[*].arn
  description = "The ARNs for all users"
}