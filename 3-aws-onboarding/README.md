# Check Point AWS CloudFormation Onboarding
This Terraform project is intended to be used to onboard an AWS Public Cloud Account in CloudGuard CSPM.    
In this folder you can find the CloudFormation Templates JSON files, and the direct link to launch them in your system.     
The IAM Policies that will be created are the public Check Point Policies [dome9 / policies](https://github.com/dome9/policies/tree/master/AWS)
 
## How to start?
As first you will need to have a CloudGuard CSPM account, if you dont have it, you can create one with this links:
1. Create an account in [Europe Region](https://secure.eu1.dome9.com/v2/register/invite)
2. Create an account in [Asia Pacific Region](https://secure.ap1.dome9.com/v2/register/invite)
3. Create an account in [United States Region](https://secure.dome9.com/v2/register/invite)

## How to launch the template
Either copy the JSON file and then uploaded to a newly created stack or launch the CloudFormation Templates directly.
These are the link to directly create all that is needed in your AWS Account:
1. Template with Read-Only Permission: [Launch R/O Stack](https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?templateURL=https://s3-cloudguard-onboarding.s3.eu-west-1.amazonaws.com/stack/cft-readonly.json)
2. Template with Read-Write Permission: [Launch R/W Stack](https://console.aws.amazon.com/cloudformation/home#/stacks/create/review?templateURL=https://s3-cloudguard-onboarding.s3.eu-west-1.amazonaws.com/stack/cft-readwrite.json)

## How to use it
You would need to give as parameter the External ID, that can be obtained here in a new onboarding here:
![AWS External ID](/zimages/aws-external-id.jpg)

## How to conclude the onboarding
From the Stack output copy the Role ARN:
![AWS Stack Output](/zimages/aws-role-arn.jpg)

Then copy it in the onboarding procedure, with the name of the account and conclude the onboarding:
![AWS Complete Onboarding](/zimages/aws-complete.jpg)
