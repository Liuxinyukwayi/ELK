#!/bin/bash

bash ansible-install.sh


# 语法检查
ansible-playbook --syntax-check site.yml

# 先跑一次（可加 -C 进行检查模式）
ansible-playbook -i hosts.ini site.yml
