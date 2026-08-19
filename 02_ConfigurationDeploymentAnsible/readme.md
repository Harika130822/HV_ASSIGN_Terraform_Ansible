



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

## Ansible Architecture Execution Flow

```mermaid
flowchart TD
    A[Control Node] -->|ansible-playbook playbooks/site.yml| B[site.yml]

    B --> C[dbservers.yml]
    C --> D[Database Host<br/>10.0.2.20]
    D --> D1[common role]
    D1 --> D2[mongodb role]
    D2 --> D3[Install MongoDB 6.0]
    D3 --> D4[Start MongoDB without authentication]
    D4 --> D5[Create admin and application users]
    D5 --> D6[Enable authentication<br/>Bind to private IP]
    D6 --> D7[security role]

    B --> E[webservers.yml]
    E --> F[Web Host<br/>3.110.85.116]
    F --> F1[common role]
    F1 --> F2[nodejs role]
    F2 --> F3[app role]
    F3 --> F4[Clone application]
    F4 --> F5[Install backend dependencies]
    F5 --> F6[Configure and start PM2]
    F6 --> F7[Install and build frontend]
    F7 --> F8[nginx role]
    F8 --> F9[Configure reverse proxy]
    F9 --> F10[security role]

    F10 --> G[Runtime Traffic]
    G --> G1[Browser]
    G1 -->|HTTP :80| G2[Nginx]
    G2 -->|Serve React build| G3[Frontend]
    G2 -->|/api proxy| G4[Node.js + PM2 :3001]
    G4 -->|MongoDB URI| G5[MongoDB :27017]

    C -.->|SSH ProxyJump through web host| D
```

## Execution Order

1. `site.yml` imports `dbservers.yml`.
2. The database host runs `common`, `mongodb`, and `security`.
3. `site.yml` imports `webservers.yml`.
4. The web host runs `common`, `nodejs`, `app`, `nginx`, and `security`.
5. Nginx serves the frontend and proxies `/api` requests to the PM2-managed backend.
6. The backend connects to MongoDB through the database host's private IP.



