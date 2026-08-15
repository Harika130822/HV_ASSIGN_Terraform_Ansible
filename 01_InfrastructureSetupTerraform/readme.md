## 1. AWS Setup and Terraform Initialization
Install AWS CLI:

Download and install the AWS CLI from the official AWS CLI page.
Verify installation

```
aws --version
```

## 2. Configure AWS CLI:

Run the following command to configure AWS CLI:


```
aws configure
```
Provide the following details:
AWS Access Key ID
AWS Secret Access Key
Default region (e.g., ap-south-1)
Output format (e.g., json)

## 3. Install Terraform:

Download Terraform from the official Terraform page.
Add Terraform to your system's PATH and verify installation:

```
terraform --version
```

## 4. Initialize a Terraform Project:

Create a new directory for your Terraform project:
```
cd EC2_VPC_Roles_SecurityGroups
```

Create a main.tf file for your Terraform configuration.
Initialize Terraform

```
terraform fmt
terraform fmt -check
terraform init
terraform validate
terraform plan
terraform apply
```


## OUTPUT

```
Outputs:

db_server_instance_ids = [
  [
    "i-0128fb75031c57d43",
  ],
]
iam_role_arn = "arn:aws:iam::129373676098:role/web_server_role"
iam_role_name = "web_server_role"
private_subnet_id = "subnet-079753f91da433535"
public_subnet_id = "subnet-0b407e69d8bb60129"
security_group_db_id = "sg-0935f0ecd78643ea8"
security_group_id = "sg-01cd11cff639b6c03"
vpc_id = "vpc-019227b426b61d59d"
web_server_instance_ids = [
  [
    "i-0c9cd13585003781d",
  ],
]
web_server_public_ip = [
  [
    "15.206.160.67",
  ],
]
```

## SSH validate to EC2

> <img width="683" height="389" alt="image" src="https://github.com/user-attachments/assets/8c912171-2f0a-4db2-b67c-cb43288fa6b7" />

## Screenshots
[Screenshot for each resource of VPC, EC2, Role and Security Groups](https://github.com/Harika130822/HV_ASSIGN_Terraform_Ansible/tree/main/01_InfrastructureSetupTerraform/Screeshots)


