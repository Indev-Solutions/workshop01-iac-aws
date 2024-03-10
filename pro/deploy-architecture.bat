@ECHO OFF

echo Deploying logic layer of networking
cd 01_networking
call terraform init
call terraform workspace list
call terraform workspace select -or-create=true workshop1-pro-networking
call terraform validate
call terraform fmt
call terraform plan -var-file="../variables.tfvars"
call terraform apply -var-file="../variables.tfvars" -auto-approve
call terraform state list

echo Deploying logic layer of bastion
cd ../02_bastion
call terraform init
call terraform workspace list
call terraform workspace select -or-create=true workshop1-pro-bastion
call terraform validate
call terraform fmt
call terraform plan -var-file="../variables.tfvars"
call terraform apply -var-file="../variables.tfvars" -auto-approve
call terraform state list

echo Deploying logic layer of database
cd ../03_database
call terraform init
call terraform workspace list
call terraform workspace select -or-create=true workshop1-pro-database
call terraform validate
call terraform fmt
call terraform plan -var-file="../variables.tfvars"
call terraform apply -var-file="../variables.tfvars" -auto-approve
call terraform state list

echo Deploying logic layer of kubernetes
cd ../04_kubernetes
call terraform init
call terraform workspace list
call terraform workspace select -or-create=true workshop1-pro-kubernetes
call terraform validate
call terraform fmt
call terraform plan -var-file="../variables.tfvars"
call terraform apply -var-file="../variables.tfvars" -auto-approve
call terraform state list

echo Deploying logic layer of frontend
cd ../05_frontend
call terraform init
call terraform workspace list
call terraform workspace select -or-create=true workshop1-pro-frontend
call terraform validate
call terraform fmt
call terraform plan -var-file="../variables.tfvars"
call terraform apply -var-file="../variables.tfvars" -auto-approve
call terraform state list
