echo Destroying logic layer of bastion
cd 02_bastion
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
