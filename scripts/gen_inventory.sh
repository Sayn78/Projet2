#!/bin/bash

# Récupère l'IP publique depuis Terraform
IP=$(terraform -chdir=terraform output -raw instance_ip)

# Fichier destination
INV_FILE="ansible/inventory.ini"

# Génère le fichier INI
cat <<EOF > $INV_FILE
[k8s]
$IP ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/sshsenan.pem
EOF

echo "✅ Fichier $INV_FILE généré avec l'adresse IP $IP"
