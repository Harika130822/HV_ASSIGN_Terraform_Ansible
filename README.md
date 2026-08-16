# HV_ASSIGN_Terraform_Ansible
HV_ASSIGN_Terraform_Ansible


# [Part 1: Infrastructure Setup with Terraform](https://github.com/Harika130822/HV_ASSIGN_Terraform_Ansible/blob/main/01_InfrastructureSetupTerraform/readme.md)


## 1. AWS Setup and Terraform Initialization
- Configure AWS CLI and authenticate with your AWS account.
- Initialize a new Terraform project targeting AWS.

[Documentation for setup of AWS CLI, Terraform ](https://github.com/Harika130822/HV_ASSIGN_Terraform_Ansible/blob/main/01_InfrastructureSetupTerraform/readme.md)

## 2. VPC and Network Configuration
- Create an AWS VPC with two subnets: one public and one private.
- Set up an Internet Gateway and a NAT Gateway.
- Configure route tables for both subnets.

[Terraform files for VPC creation](https://github.com/Harika130822/HV_ASSIGN_Terraform_Ansible/tree/main/01_InfrastructureSetupTerraform/VPC)

## 3. EC2 Instance Provisioning
- Launch two EC2 instances:
  - One in the public subnet (for the web server).
  - Another in the private subnet (for the database).
- Ensure both instances are accessible via SSH:
  - Public instance only accessible from your IP.

[Terraform Files for EC2 Creation](https://github.com/Harika130822/HV_ASSIGN_Terraform_Ansible/tree/main/01_InfrastructureSetupTerraform/EC2)

## 4. Security Groups and IAM Roles
- Create necessary security groups for web and database servers.
- Set up IAM roles for EC2 instances with required permissions.

[Terraform Files for Roles and Security Groups Creation](https://github.com/Harika130822/HV_ASSIGN_Terraform_Ansible/tree/main/01_InfrastructureSetupTerraform/Roles%26SecurityGroups)

## 5. Resource Output
- Output the public IP of the web server EC2 instance.

[Screenshot for each resource of VPC, EC2, Role and Security Groups](https://github.com/Harika130822/HV_ASSIGN_Terraform_Ansible/tree/main/01_InfrastructureSetupTerraform/Screeshots)


---

# Part 2: Configuration and Deployment with Ansible

## 1. Ansible Configuration
- Configure Ansible to communicate with the AWS EC2 instances.

## 2. Web Server Setup
- Write an Ansible playbook to:
  - Install Node.js and NPM on the web server.
  - Clone the MERN application repository and install dependencies.

## 3. Database Server Setup
- Install and configure MongoDB on the database server using Ansible.
- Secure the MongoDB instance and create necessary users and databases.

## 4. Application Deployment
- Configure environment variables and start the Node.js application.
- Ensure the React frontend communicates with the Express backend.

## 5. Security Hardening
- Harden the security by configuring firewalls and security groups.
- Implement additional security measures as needed:
  - SSH key pairs.
  - Disabling root login.

---


```
                    Internet
                        |
                Route53 / Public DNS
                        |
                 AWS Security Group
                        |
                +----------------+
                |  Web EC2       |
                | Public Subnet  |
                |----------------|
                | React Frontend |
                | Express API    |
                | PM2            |
                +--------+-------+
                         |
                Port 5000/3001
                         |
         Private Security Group Rule
                         |
                +--------v-------+
                |  MongoDB EC2   |
                | Private Subnet |
                |----------------|
                | MongoDB 7.x    |
                | travelmemorydb |
                +----------------+

Terraform ---> Creates Infrastructure
Ansible -----> Configures Servers & Deploys App

```

# Deliverables
- **Terraform scripts** for AWS infrastructure setup.
- **Ansible playbooks** for configuration and deployment of the MERN application.
- **A detailed report** documenting the implementation process, including how the application components interact with each other and the infrastructure.
- **Screenshots or a video recording** demonstrating the working MERN application.
