What is Infrastructure as a Code? Infrastructure as a code is the process of provisioning and managing cloud resources through machine-readable definition files, rather than manual methods. What is Infrastructure as a Code? Infrastructure as a code is the process of provisioning and managing cloud resources through machine-readable definition files, rather than manual methods. Popular tools:

    Terraform
    AWS CloudFormation

What Is Terraform? ->Terraform is an open-source and most popular Infrastructure-as-code (IaC) tool, used to provision cloud resources. ->Terraform is developed by HashiCorp and written in GO language.

Terraform File configuration:

    Provider Block : Define the provider (eg, AWS, Azure..etc) and its configuration
    Resource Block : Declare the resources and its attributes
    Variable Block: Input variables are used as parameters to input values, without altering the source code. ->Variable.tf - is a file where you define the variables used in your Terraform configuration. String Number List Map Declaration ->Variable.tfvars - is a file where you provide specific values when executing the file. terraform apply -var-file=my_variables.tfvars
    Output Block: Output values are like the return values of a Terraform file after applying.

Interpolation the process of using points with known values to estimate values of other unknown points

    String : "${var.name}"
    Attribute: aws_instance_example.id

Resource Dependencies:

    depends_on : Define explicit dependencies between resources.

State Management:

    Local backend - TF is stored locally.
    Remote backend - TF file is stored in remote locations such as S3 or dynamodb.

Terraform Commands:

init -> Prepare your working directory for other commands 
validate -> Check whether the configuration is valid 
plan -> Show changes required by the current configuration 
apply -auto-approve -> Create or update infrastructure 
apply -var-file="varfile.tfvars" -> Pass in variables contained in a file 
-chdir=environments/production apply -> Switching working directory 
destroy -auto-approve -> Destroy previously-created infrastructure
