

## Deployment Flow

Terraform
   |
   +--> VPC
   +--> Public Subnet
   +--> Private Subnet
   +--> Web EC2
   +--> MongoDB EC2
   +--> Security Groups

Ansible
   |
   +--> Install NodeJS
   +--> Install MongoDB
   +--> Secure MongoDB
   +--> Clone TravelMemory
   +--> Create .env files
   +--> npm install
   +--> npm run build
   +--> PM2 start
   +--> UFW hardening
   +--> Disable root login

Result:
TravelMemory React UI
        |
Express API
        |
MongoDB Private EC2