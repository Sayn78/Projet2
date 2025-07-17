# Projet 2 - DevOps : Cluster Kubernetes sur AWS

Ce projet met en œuvre un pipeline DevOps complet déployé sur AWS, avec les outils suivants :

- **Terraform** : provisionnement de l'infrastructure AWS
- **Ansible** : configuration des machines et du cluster
- **Kubernetes** : orchestration des conteneurs
- **Jenkins** : pipeline CI/CD
- **Docker** : containerisation de l'application
- **Grafana & Prometheus** : monitoring
- **ELK Stack (Elasticsearch, Logstash, Kibana)** : gestion des logs

## 📦 Application Node.js

L'application déployée est une API minimaliste en Node.js avec une interface HTML statique.

## 📁 Structure du projet

projet2/
├── app/ # Code source Node.js + Dockerfile
├── terraform/ # Provisionnement AWS (EC2 ou EKS)
├── ansible/ # Rôles Ansible
├── jenkins/ # Jenkinsfile, Docker Jenkins si besoin
├── k8s/ # Manifests Kubernetes (deployment, service, etc.)
├── monitoring/ # Stack Prometheus, Grafana, ELK
├── scripts/ # Scripts shell utilitaires


---

### 🔒 `.gitignore` de base

```gitignore
# Node.js
node_modules/
.env

# Terraform
.terraform/
*.tfstate
*.tfstate.backup

# Ansible
*.retry

# Logs
*.log

# Docker
*.tar
