[webservers]
${web_server_public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/travelmemory.pem ansible_ssh_common_args='-o StrictHostKeyChecking=no'

[dbservers]
${db_server_private_ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/travelmemory.pem ansible_ssh_common_args='-o ProxyJump=ubuntu@${web_server_public_ip} -o StrictHostKeyChecking=no' 

[all:vars]
ansible_python_interpreter=/usr/bin/python3