# Terraform-VPC-Advanced
## Summary
This Terraform code creates a VPC with two public and two private subnets, two users, and two servers in the public subnets.

## Components
The following components are created by this Terraform code:

- A VPC with a CIDR block of 10.0.0.0/16
- Two public subnets with CIDR blocks of 10.0.1.0/24 and 10.0.2.0/24
- Two private subnets with CIDR blocks of 10.0.3.0/24 and 10.0.4.0/24
- Two users named Pete Locke and Tim Grimly
- Two servers in the public subnets with a security group that allows all inbound and outbound traffic

## Configuration
To configure this code, you will need to specify the following:

- The region in which to create the VPC and its associated resources. This is specified in the provider block.
- The AMI to use for the servers. This is specified in the ami argument of the aws_instance resource.
- The key pair to use for the servers.
Usage
To use this code, you will need to do the following:

Install Terraform and configure your AWS credentials.
Create a new directory for your Terraform code.
Copy the code above into a file named main.tf in your new directory.
Run terraform init to initialize the directory.
Run terraform plan to see the resources that will be created.
If the plan looks correct, run terraform apply to create the resources.
