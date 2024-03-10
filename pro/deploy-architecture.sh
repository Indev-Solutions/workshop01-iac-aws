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
