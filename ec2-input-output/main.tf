provider "aws" {
  region = "us-east-1"
  access_key = "AKIARXM45NH26CHNOWEE"
  secret_key = "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"
}
resource "aws_instance" "ubuntu" {
 ami = var.ubuntu-ami
 instance_type = var.small-instance
 key_name = var.keypair
 vpc_security_group_ids = [var.security_group]
 subnet_id = var.publicsubnetid
 associate_public_ip_address = "true"

 tags = var.tags
}

/*resource "aws_instance" "red" {
 ami = var.redhat-ami
 instance_type = var.medium-instance
 key_name = var.keypair
 vpc_security_group_ids = [var.security_group]
 subnet_id = var.publicsubnetid
 associate_public_ip_address = "true"

 tags = {
  Name = "redhat"
 }
}*/

