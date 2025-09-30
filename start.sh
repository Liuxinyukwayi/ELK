#!/bin/bash

#安装ansible
#bash ansible-install.sh

#配置sudo免密码
ansible-playbook -i elk-ansible/hosts.ini sudoers.yml --ask-become-pass
# 语法检查
ansible-playbook -i elk-ansible/hosts.ini --syntax-check site.yml
# 先跑一次（可加 -C 进行检查模式）
ansible-playbook -i elk-ansible/hosts.ini site.yml
