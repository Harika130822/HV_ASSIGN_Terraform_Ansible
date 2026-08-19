



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

