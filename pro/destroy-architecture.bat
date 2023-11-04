@ECHO OFF

echo Destroying logic layer of bastion
cd 02_bastion
call terraform init
call terraform workspace list
call terraform workspace select workshop1-iac-pro-bastion
call terraform destroy -var-file="../variables.tfvars" -auto-approve

echo Destroying logic layer of networking
cd ../01_networking
call terraform init
call terraform workspace list
call terraform workspace select workshop1-iac-pro-networking
call terraform destroy -var-file="../variables.tfvars" -auto-approve
