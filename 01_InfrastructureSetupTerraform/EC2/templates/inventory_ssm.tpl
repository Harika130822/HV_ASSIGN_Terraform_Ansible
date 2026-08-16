[webservers]
${web_server_instance_ids} ansible_user=${web_server_ssh_user} ansible_ssh_private_key_file=~/.ssh/travelmemory.pem ansible_ssh_common_args='-o StrictHostKeyChecking=no'

[dbservers]
${db_server_instance_ids} ansible_user=${db_server_ssh_user} ansible_ssh_private_key_file=~/.ssh/travelmemory.pem ansible_ssh_common_args='-o ProxyJump=${web_server_ssh_user}@${web_server_instance_ids} -o StrictHostKeyChecking=no' 

[all:vars]
ansible_python_interpreter=/usr/bin/python3