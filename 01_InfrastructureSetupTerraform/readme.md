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
terraform output
terraform destroy
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

## Data Flow
Root Module → Orchestrates 3 modular components

VPC Module → Provides networking infrastructure (VPC, subnets, gateways)

Security Module → Creates security & IAM configurations (references VPC outputs)

EC2 Module → Deploys instances using outputs from VPC & Security modules

## Folder Structure

```
01_InfrastructureSetupTerraform/
├── main.tf                          # Root module orchestrating all components
├── outputs.tf                       # Root level outputs
├── readme.md                        # Documentation (this file)
│
├── VPC/                             # Virtual Private Cloud Module
│   ├── main.tf                      # VPC, Subnets, IGW, NAT Gateway configurations
│   ├── variables.tf                 # VPC input variables
│   ├── outputs.tf                   # VPC outputs (vpc_id, subnet_ids)
│   └── terraform.tfvars             # VPC variable values
│
├── EC2/                             # Elastic Compute Cloud Module
│   ├── main.tf                      # Web and DB server instance configurations
│   ├── data.tf                      # Data sources (AMI lookups)
│   ├── variables.tf                 # EC2 input variables
│   ├── outputs.tf                   # EC2 outputs (instance_ids, public_ip)
│   ├── terraform.tfvars             # EC2 variable values
│   ├── my-key                       # SSH private key (keep secure)
│   └── my-key.pub                   # SSH public key
│
├── Roles&SecurityGroups/            # IAM Roles and Security Groups Module
│   ├── main.tf                      # Security groups and IAM role configurations
│   ├── data.tf                      # Data sources
│   ├── variables.tf                 # Input variables
│   ├── outputs.tf                   # IAM and SG outputs
│   └── terraform.tfvars             # Variable values
│
└── Screeshots/                      # Directory for infrastructure screenshots
    └── readme.md                    # Screenshots documentation
```

## Module Relationships

```
main.tf (Root)
    ├─→ VPC Module
    │   ├─ aws_vpc.main
    │   ├─ aws_subnet.public & private
    │   ├─ aws_internet_gateway
    │   ├─ aws_nat_gateway
    │   └─ Route tables
    │
    ├─→ Roles&SecurityGroups Module
    │   ├─ aws_security_group (web_sg)
    │   ├─ aws_security_group (db_sg)
    │   ├─ aws_iam_role
    │   └─ aws_iam_instance_profile
    │
    └─→ EC2 Module
        ├─ aws_instance (web_server) → Public Subnet
        ├─ aws_instance (db_server)  → Private Subnet
        └─ aws_key_pair
```
