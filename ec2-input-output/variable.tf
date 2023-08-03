#Example for declariton
variable "ubuntu-ami" {
    default = "ami-053b0d53c279acc90"  //AMI id it will vary region to region
}
variable "keypair" {
    default = "maheswari" //update key pair name
}
variable "small-instance" {
    default = "t2.micro"
}
variable "publicsubnetid" {
    default = "subnet-0cf2c3942af169fec" //update subnet id
}
#Example for list
variable "security_group" {
    type        = list(string)
    default = ["sg-12345678", "sg-87654321"]  //update sg ids
}
#Example for map and strings
variable "tags" {
  type        = map(string)                       
  description = "Map of tags with string keys and values"
  default = {
    Name = "product"
    Environment = "Staging"
    Owner       = "Jane Doe"
    Project     = "SAP"
  }
}
variable "instance_count" {
  type        = number
  description = "The number of EC2 instances to launch."
  default     = 1
}