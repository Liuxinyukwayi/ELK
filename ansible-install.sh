#!/bin/bash

HOST1="172.20.10.3"
HOST2="172.20.10.5"
HOST3="172.20.10.6"

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


