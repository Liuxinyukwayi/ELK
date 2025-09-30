#!/bin/bash

source ./group_vars/vars.sh

# Install Ansible on a Linux system
sudo apt update
sudo apt install -y ansible

ansible --version
echo "Ansible installation completed."

#SSH Key Setup
ssh-keygen -t ed25519 -f ~/.ssh/id_ansible -N ""
ssh-copy-id -i ~/.ssh/id_ansible.pub cc@$HOST1
ssh-copy-id -i ~/.ssh/id_ansible.pub cc@$HOST2
ssh-copy-id -i ~/.ssh/id_ansible.pub cc@$HOST3
echo "SSH key setup completed."

echo -e "Host 172.20.10.*\n    User cc\n    IdentityFile /root/.ssh/id_ansible" >> ~/.ssh/config
chmod 600 ~/.ssh/config

