- Ansible установлен на вашей локальной машине
- Доступ по SSH к серверам
- В файле `inventory/hosts.yml` указаны IP-адреса серверов

# Установка на мастер-ноде
ansible-playbook -i hosts.yml playbooks/setup_server.yml --limit k8s_master

# На узле-работе
ansible-playbook -i hosts.yml playbooks/setup_server.yml --limit k8s_node

# Или сразу на всех
ansible-playbook -i hosts.yml playbooks/setup_server.yml

