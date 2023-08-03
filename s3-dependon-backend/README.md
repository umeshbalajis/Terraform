In this Module We'll see 2 topics:

1.  Terraform File and backend configuration
2. depends_on
-------------------------------------------------------------------------------------------------------
**Terraform state File**
The state file contains information about the resources that Terraform has provisioned and their current configuration. It helps Terraform track changes, perform updates, and destroy resources accurately.

This state file can be stored local (Local backend) or in remote location (Remote backend) such as S3 or Dynamodb 

If you're using bucket update the bucket policy attached in the folder.
-------------------------------------------------------------------------------------------------------
**Resource Dependencies**
depends_on : Define explicit dependencies between resources.It is a way to express that one resource depends on one another.

Syntax: depends_on = [aws_resource_name.referende_name]
--------------------------------------------------------------------------------------------------------