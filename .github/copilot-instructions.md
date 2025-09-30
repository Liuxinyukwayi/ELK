# Copilot Instructions for ELK Ansible Project

## 项目架构概览
- 本项目用于通过 Ansible 自动化部署 ELK（Elasticsearch, Logstash, Kibana）栈。
- 主要结构：
  - `elk-ansible/`：Ansible 配置文件（`ansible.cfg`）、主机清单（`hosts.ini`）。
  - `group_vars/`：分组变量，主要包括 `elasticsearch.yml` 和 `vars.sh`，用于配置 Elasticsearch。
  - `templates/`：Jinja2 模板文件（如 `elasticsearch.yml.j2`, `kibana.yml.j2`），用于动态生成配置。
  - 根目录脚本：`ansible-install.sh`、`start.sh` 用于一键安装和启动。
  - `site.yml`：主入口 playbook，定义整体部署流程。

## 关键开发与运维流程
- 修改主机配置：编辑 `elk-ansible/hosts.ini`。
- 变更 Elasticsearch 配置：编辑 `group_vars/elasticsearch.yml` 和 `group_vars/vars.sh`。
- 修改 Kibana 配置：编辑 `templates/kibana.yml.j2`。
- 部署/安装：运行 `ansible-install.sh`（通常在 Linux 环境下）。
- 启动服务：运行 `start.sh`。
- Playbook 执行：
  ```sh
  ansible-playbook -i elk-ansible/hosts.ini site.yml
  ```

## 项目约定与模式
- 所有配置变更优先在 `group_vars/` 和 `templates/` 下进行，避免直接修改目标主机。
- 使用 Jinja2 模板进行配置文件渲染，变量来源于 `group_vars/`。
- 脚本和 playbook 入口均在项目根目录，便于一键操作。
- 变量命名与 Ansible 官方推荐一致，避免自定义复杂结构。

## 外部依赖与集成
- 依赖 Ansible 环境，建议 2.9+ 版本。
- 目标主机需开放 SSH 并具备 sudo 权限。
- Elasticsearch/Kibana 版本与配置可在模板和变量文件中调整。

## 重要文件示例
- `group_vars/elasticsearch.yml`：定义 Elasticsearch 相关变量。
- `templates/elasticsearch.yml.j2`：渲染后的配置文件模板。
- `elk-ansible/hosts.ini`：主机清单，格式需符合 INI 规范。
- `site.yml`：主 playbook，建议逐步阅读理解任务流。

## 其他说明
- 若需扩展 Logstash 或 Beats，请参考现有模板和变量结构。
- 所有自动化流程建议在 Linux 环境下执行，Windows 仅用于开发。

---
如有不清楚或遗漏的部分，请反馈以便补充完善。
