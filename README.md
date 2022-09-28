# Repositório para Estudo de IaC Tools e K8S

## Pré requisitos (Maquina Ubuntu):

1. Instalar o packer localmente seguindo o link: https://learn.hashicorp.com/tutorials/packer/get-started-install-cli;
2. Instalar o ansible localmente seguindo o link: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html;
3. Instalar o Python3 e a lib boto3: `sudo apt-get install python3-pip -y && sudo pip3 install boto boto3`
4. Criar arquivo na raiz awscredentials com as credenciais da AWS;

## Tools usadas

### Packer

1. Dentro da pasta do /packer, iniciar o repositório com o comando `packer init .`;
2. Realizar o build da imagem com ocomando `packer build .`;

### Terraform

1. Dentro da pasta do /terraform, iniciar o repositório com o comando `terraform init`;
2. Realizar o apply com o comando `terraform apply --auto-approve`;
3. Via shell acessar a pasta /terraform/keys e executar o ssh para conectar a algum ip que saiu no output. Ex acessando a maquina Control Plane: `ssh -i node-k8s.pem ubuntu@34.201.23.68`;

### Ansible

1. Acessar pasta /ansible/ e rodar o comando: `export AWS_CONFIG_FILE=../awscredentials` (caso algum erro de conexão com a AWS, colocar as credenciais no caminho default .aws/credentials);
2. Rodar o comando `ansible-inventory --graph` para testar a conectividade com as maquinas;
3. Rodar os comandos `ansible-playbook control-plane.yaml` para configurar a maquina Control Plane;
4. Rodar os comandos `ansible-playbook workloads.yaml` para configurar as maquinas Workloads;
5. Acessar via ssh a maquina de Control Plane e rodar os comandos para teste: `kubectl get nodes` e `kubectl get all -A`. No primeiro comando vai mostras as maquinas workloads conectadas junto ao Control Plane;