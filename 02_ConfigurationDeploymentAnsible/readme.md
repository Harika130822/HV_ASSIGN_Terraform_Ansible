



## Ansible Terminal commands

```
ansible-vault encrypt inventory/group_vars/vaults.yml
ansible-inventory -i inventory/hosts.ini --list --ask-vault-pass
ansible-playbook -i inventory/hosts.ini playbooks/site.yml --ask-vault-pass
```

## Folder Structure

```
├───ansible
│   ├───inventory
│   │   └───group_vars
│   ├───playbooks
│       ├───dbservers.yml
│       ├───site.yml
│       ├───webservers.yml
│   └───roles
│       ├───app
│       │   ├───tasks
│       │   └───templates
│       ├───common
│       │   └───tasks
│       ├───mongodb
│       │   ├───handlers
│       │   ├───tasks
│       │   └───templates
│       ├───nginx
│       │   ├───handlers
│       │   ├───tasks
│       │   └───templates
│       ├───nodejs
│       │   └───tasks
│       └───security
│           ├───handlers
│           └───tasks
└───Screenshots

```

## Screenshot of Trigger

[Screenshots taken while execution and validating the browser](https://github.com/Harika130822/HV_ASSIGN_Terraform_Ansible/blob/main/02_ConfigurationDeploymentAnsible/Screenshots/readme.md)


## Execution Output

[Execution Output](https://github.com/Harika130822/HV_ASSIGN_Terraform_Ansible/blob/main/02_ConfigurationDeploymentAnsible/ansible_ubuntu_execution_output.txt)

## validation outputs

> <img width="520" height="874" alt="image" src="https://github.com/user-attachments/assets/239984b2-d0d8-4588-bb6d-e15fcecbfeef" />




