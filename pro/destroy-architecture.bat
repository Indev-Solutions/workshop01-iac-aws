@ECHO OFF

echo Destroying logic layer of kubernetes
cd 04_kubernetes
call terraform init
call terraform workspace list
call terraform workspace select workshop1-pro-kubernetes
call terraform destroy -var-file="../variables.tfvars" -auto-approve

echo Destroying logic layer of database
cd ../03_database
call terraform init
call terraform workspace list
call terraform workspace select workshop1-pro-database
call terraform destroy -var-file="../variables.tfvars" -auto-approve

echo Destroying logic layer of bastion
cd ../02_bastion
call terraform init
call terraform workspace list
call terraform workspace select workshop1-pro-bastion
call terraform destroy -var-file="../variables.tfvars" -auto-approve

echo Destroying logic layer of networking
cd ../01_networking
call terraform init
call terraform workspace list
call terraform workspace select workshop1-pro-networking
call terraform destroy -var-file="../variables.tfvars" -auto-approve
