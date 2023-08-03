#Declare Provider
provider "aws" {
  region = "us-east-1"
  access_key = "AKIARXM45NH26CHNOWEE"
  secret_key = "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"
}
#Creating VPC
resource "aws_vpc" "project_vpc" {
    cidr_block       = "10.0.0.0/16"
    tags = {
    Name = "project-VPC"
  }
}
#Creating public Subnet
resource "aws_subnet" "project_public" {
     vpc_id     = aws_vpc.project_vpc.id //interpolation
     cidr_block             = "10.0.0.0/24"
     availability_zone = "us-east-1a"

tags = {
    Name = "project-Public"
  } 
}
#Creating private Subnet
resource "aws_subnet" "project_private" {
     vpc_id     = aws_vpc.project_vpc.id
     cidr_block             = "10.0.1.0/24"
     availability_zone = "us-east-1a"

tags = {
    Name = "project-private"
  }
}
#Creating Internet gateway
resource "aws_internet_gateway" "project_igw" {
  vpc_id   = aws_vpc.project_vpc.id
  tags = {
    Name = "project-igw"
  }
}
#Create Elastic IP
resource "aws_eip" "project_nat_eip" {
  domain   = "vpc"
  tags = {
      Name = "project-nat-eip"
  }
}
#Create NAT gateway
resource "aws_nat_gateway" "project_natgateway"{
   allocation_id= aws_eip.project_nat_eip.id
   subnet_id = aws_subnet.project_public.id
    tags = {
      Name = "Project-Natgateway"
          }
}
#Creating Public route table with IGW Route
resource "aws_route_table" "project_public_rt" {
  vpc_id = aws_vpc.project_vpc.id
        route {
        cidr_block = "0.0.0.0/0"         
        gateway_id = aws_internet_gateway.project_igw.id
    }
      tags = {
      Name = "Project-public"
          }
}
#Creating Private route table with NAT Route
resource "aws_route_table" "project_private_rt" {
  vpc_id = aws_vpc.project_vpc.id
      route {
        cidr_block = "0.0.0.0/0"         
        gateway_id = aws_nat_gateway.project_natgateway.id
    }
      tags = {
      Name = "Project-private"
          }
}
#Associating public subnet with public route table
resource "aws_route_table_association" "project_public_Associations"{
    subnet_id = aws_subnet.project_public.id
    route_table_id = aws_route_table.project_public_rt.id
}
#Associating private subnet with pivate route table
resource "aws_route_table_association" "project_private_Associations"{
    subnet_id = aws_subnet.project_private.id
    route_table_id = aws_route_table.project_private_rt.id
}