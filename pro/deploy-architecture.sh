echo Deploying logic layer of networking
cd 01_networking
terraform init
terraform workspace list
terraform workspace select -or-create=true workshop1-pro-networking
terraform validate
terraform fmt
terraform plan -var-file="../variables.tfvars"
terraform apply -var-file="../variables.tfvars" -auto-approve
terraform state list

echo Deploying logic layer of bastion
cd ../02_bastion
terraform init
terraform workspace list
terraform workspace select -or-create=true workshop1-pro-bastion
terraform validate
terraform fmt
terraform plan -var-file="../variables.tfvars"
terraform apply -var-file="../variables.tfvars" -auto-approve
terraform state list

echo Deploying logic layer of database
cd ../03_database
terraform init
terraform workspace list
terraform workspace select -or-create=true workshop1-pro-database
terraform validate
terraform fmt
terraform plan -var-file="../variables.tfvars"
terraform apply -var-file="../variables.tfvars" -auto-approve
terraform state list

echo Deploying logic layer of kubernetes
cd ../04_kubernetes
terraform init
terraform workspace list
terraform workspace select -or-create=true workshop1-pro-kubernetes
terraform validate
terraform fmt
terraform plan -var-file="../variables.tfvars"
terraform apply -var-file="../variables.tfvars" -auto-approve
terraform state list

echo Deploying logic layer of integration
cd ../05_integration
terraform init
terraform workspace list
terraform workspace select -or-create=true workshop1-pro-integration
terraform validate
terraform fmt
terraform plan -var-file="../variables.tfvars"
terraform apply -var-file="../variables.tfvars" -auto-approve
terraform state list

echo Deploying logic layer of frontend
cd ../06_frontend
terraform init
terraform workspace list
terraform workspace select -or-create=true workshop1-pro-frontend
terraform validate
terraform fmt
terraform plan -var-file="../variables.tfvars"
terraform apply -var-file="../variables.tfvars" -auto-approve
terraform state list
