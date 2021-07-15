# Check Point CPSM Configuration
This Terraform project is intended to create a Kubernetes environment in GCP and onboards it in the CloudGuard Native Portal.     
In this case, we use four different Terraform providers: [Google Cloud](https://registry.terraform.io/providers/hashicorp/google/latest), [Kubernetes](https://registry.terraform.io/providers/hashicorp/kubernetes/latest), [Helm](https://registry.terraform.io/providers/hashicorp/helm/latest), [CloudGuard](https://registry.terraform.io/providers/dome9/dome9/latest). As per my deployments (made in London), this project creates all of the following in about __10 minutes__.    

## Which are the components created?
The project creates the following resources and combines them:
1. **GCP Networks**: it connects to GCP and create a VPC with a subnet
2. **GCP Kubernetes Cluster**: it creates a GKE cluster in the environment
3. **Juice Shop Deployment**: it deploys a Juice Shop test application
4. **Cluster Onboarding**: it creates the environment in the CloudGuard Portal
5. **Notification**: it creates a notification to send the findings via mail
6. **Continuous Compliance Policy**: it creates a continuous policy with the Kubernetes Best Practice Ruleset
7. **Create the Check Point components**: it creates all the components needed in the cluster using a Helm Chart

## How to start?
First, you need to have a CloudGuard CSPM account, and if you don't, you can create one with these links:
1. Create an account in [Europe Region](https://secure.eu1.dome9.com/v2/register/invite)
2. Create an account in [Asia Pacific Region](https://secure.ap1.dome9.com/v2/register/invite)
3. Create an account in [United States Region](https://secure.dome9.com/v2/register/invite)

## Get API credentials in your CPSM Portal
Then you will need to get the API credentials that you will be using with Terraform to onboard the accounts.

![CSPM Service Account](/zimages/create-cpsm-serviceaccount.jpg)

Remember to copy these two values! You will need to enter them in the *.tfvars* file later on.

## Get the Key to access your Google Cloud Project
You would need to create an access to your GCP Project that Terraform will use to access your environment.    
First you would need to create a Service Account with the following steps:    
![GCP Service Account](/zimages/create-gcp-serviceaccount.jpg)

Once you have created the Service account you would need to create a JSON Key and put it in the project folder:    
![GCP SA Key](/zimages/create-gcp-key.jpg)

## How to use it
The only thing that you need to do is changing the __*terraform.tfvars*__ file located in this directory.

```hcl
# Set in this file your deployment variables
gcp-region       = "xxxxxxxxxxxxxx"
gcp-project      = "xxxxxxxxxxxxxx"
gcp-cluster-name = "xxxxxxxxxxxxxx"
gcp-key-name     = "xxxxxxxxxxxxxx.json"

cspm-key-id      = "xxxxxxxxxxxxxx"
cspm-key-secret  = "xxxxxxxxxxxxxx"
cspm-org-unit    = "xxxxxxxxxxxxxx"
cspm-admin-mail  = "xxxxxxxxxxxxxx"

# Select your CSPM residency: usea1 [default], euwe1, apso1
cspm-residency   = "usea1"
```
If you want (or need) to further customize other project details, you can change defaults in the different __*name-variables.tf*__ files.
Here you will also be able to find the descriptions that explain what each variable is used for.