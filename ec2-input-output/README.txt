**Variable Block**
Input variables are used as parameters to input values, without altering the source code.
->Variable.tf - is a file where you define the variables used in your Terraform configuration.
    String
    Number
    List
    Map
    Declaration
->Variable.tfvars -  is a file where you provide specific values when executing the file.
    terraform apply -var-file=variables.tfvars
--------------------------------------------------------------------------------------------------
**Output Block**
Output values are like the return values of a Terraform file after applying.
