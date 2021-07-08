<<<<<<< HEAD
# Terraform Projects
This repository is a collection of Terraform automation projects applicable to Check Point CloudGuard Native Solution, which are intended to be used as a template in a demonstration or to build a test environment.  In the directories, you will find a description of what each project does and if you want (or need) to customize them, you can change defaults in the different __*name-variables.tf*__ files. 

## Which are the projects available?
The projects can be briefly described as follows:
1. **..native/multiple-onboarding**: It onboards multiple Public Cloud accounts (Azure/AWS/GCP) and K8s Clusters in one-shot
2. **..native/k8s-workload**: It configures an existing Check Point management through APIs with the settings needed in a GWLB Centralized Architecture

=======
# Check Point CSPM Configuration
This Terraform project is intended to be used to onboard multiple Public Cloud accounts (Azure/AWS/GCP) and K8s Clusters in one-shot.     
What it does is configuring through API (with **Terraform**) an existing CloudGuard CSPM Portal.      
 
>>>>>>> 7b566f3a0b1f4e03bf674daca5cbc7a4a019fb91
## Do you want to see more? 
Check out my Terraform Microsoft Azure repository here: [gbrembati / terraform-azure](https://github.com/gbrembati/terraform-azure)   
Check out my Terraform Amazon Web Services repository here: [gbrembati / terraform-aws](https://github.com/gbrembati/terraform-aws)   
Check out my Terraform Google Cloud Platform repository here: [gbrembati / terraform-gcp](https://github.com/gbrembati/terraform-gcp)    
   
Check the Check Point official CloudGuard IaaS repository here: [CheckPointSW / CloudGuardIaaS](https://github.com/CheckPointSW/CloudGuardIaaS)

<<<<<<< HEAD
## How do you use these projects?
The first thing that you need to do is download this repository, either via "*git clone*" or "*download as ZIP*".  
Choose which are projects that you want to use, and in each directory change the relative __*terraform.tfvars*__ file.   
Once you have done the above, simply go inside the directory of a single project and run these terraform commands.
=======
## How to start?
First, you need to have a CloudGuard CSPM account, if you don't, you can create one with these links:
1. Create an account in [Europe Region](https://secure.eu1.dome9.com/v2/register/invite)
2. Create an account in [Asia Pacific Region](https://secure.ap1.dome9.com/v2/register/invite)
3. Create an account in [United States Region](https://secure.dome9.com/v2/register/invite)

## Get API credentials in your CSPM Portal
Then you will need to get the API credentials that you will be using with Terraform to onboard the accounts.

![Architectural Design](/zimages/create-cpsm-api.jpg)

Remember to copy these two values, you will need to enter them in the *.tfvars* file later on.

## How to use it
The only thing that you need to do is changing the __*terraform.tfvars*__ file located in this directory.
>>>>>>> 7b566f3a0b1f4e03bf674daca5cbc7a4a019fb91

##
To prepare the current working directory (and install the required providers) run :
```hcl
terraform init 
```
<<<<<<< HEAD
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
=======
If you want (or need) to further customize other project details, you can change defaults in the different __*name-variables.tf*__ files.   
Here you will also able to find the descriptions that explains what each variable is used for.
>>>>>>> 7b566f3a0b1f4e03bf674daca5cbc7a4a019fb91
