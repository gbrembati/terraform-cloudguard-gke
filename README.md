# Terraform Projects
This repository is a collection of Terraform automation projects applicable to Check Point CloudGuard Native Solution, which are intended to be used as a template in a demonstration or to build a test environment.  In the directories, you will find a description of what each project does and if you want (or need) to customize them, you can change defaults in the different __*name-variables.tf*__ files. 

## Which are the projects available?
The projects can be briefly described as follows:
1. **..native/multiple-onboarding**: It onboards multiple Public Cloud accounts (Azure/AWS/GCP) and K8s Clusters in one-shot
2. **..native/k8s-workload**: It configures an existing Check Point management through APIs with the settings needed in a GWLB Centralized Architecture

## Do you want to see more? 
Check out my Terraform Microsoft Azure repository here: [gbrembati / terraform-azure](https://github.com/gbrembati/terraform-azure)   
Check out my Terraform Amazon Web Services repository here: [gbrembati / terraform-aws](https://github.com/gbrembati/terraform-aws)   
Check out my Terraform Google Cloud Platform repository here: [gbrembati / terraform-gcp](https://github.com/gbrembati/terraform-gcp)    
   
Check the Check Point official CloudGuard IaaS repository here: [CheckPointSW / CloudGuardIaaS](https://github.com/CheckPointSW/CloudGuardIaaS)

## How do you use these projects?
The first thing that you need to do is download this repository, either via "*git clone*" or "*download as ZIP*".  
Choose which are projects that you want to use, and in each directory change the relative __*terraform.tfvars*__ file.   
Once you have done the above, simply go inside the directory of a single project and run these terraform commands.

##
To prepare the current working directory (and install the required providers) run :
```hcl
terraform init 
```
##
To create an execution plan (and see the changes that will be made in your environment) run :
```hcl
terraform plan
``` 
##
To apply the changes required to reach the desired state (and create your environment) run :
```hcl
terraform apply
```
## 
To destroy the Terraform-managed infrastructure, run:
```hcl
terraform destroy
```