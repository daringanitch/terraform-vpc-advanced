# Terraform-VPC-Advanced

**Summary**: 
This Terraform code creates a VPC with two public and two private subnets, two users, and two servers in the public subnets in AWS.

**Purpose**: 
The purpose of this Terraform code is to create a VPC with two public and two private subnets, two users, and two servers in the public subnets.

**Components**: 
The following components are created by this Terraform code:

- A VPC with a CIDR block of 10.0.0.0/16
- Two public subnets with CIDR blocks of 10.0.1.0/24 and 10.0.2.0/24
- Two private subnets with CIDR blocks of 10.0.3.0/24 and 10.0.4.0/24
- Two users named Pete Locke and Tim Grimly
- Two servers in the public subnets with a security group that allows all inbound and outbound traffic
