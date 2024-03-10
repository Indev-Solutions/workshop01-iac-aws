echo Destroying logic layer of frontend
cd 05_frontend
terraform init
terraform workspace list
terraform workspace select workshop1-pro-frontend
terraform destroy -var-file="../variables.tfvars" -auto-approve

echo Destroying logic layer of kubernetes
cd ../04_kubernetes
terraform init
terraform workspace list
terraform workspace select workshop1-pro-kubernetes
terraform destroy -var-file="../variables.tfvars" -auto-approve

echo Destroying logic layer of database
cd ../03_database
terraform init
terraform workspace list
terraform workspace select workshop1-pro-database
terraform destroy -var-file="../variables.tfvars" -auto-approve

echo Destroying logic layer of bastion
cd ../02_bastion
terraform init
terraform workspace list
terraform workspace select workshop1-pro-bastion
terraform destroy -var-file="../variables.tfvars" -auto-approve

echo Destroying logic layer of networking
cd ../01_networking
terraform init
terraform workspace list
terraform workspace select workshop1-pro-networking
terraform destroy -var-file="../variables.tfvars" -auto-approve
