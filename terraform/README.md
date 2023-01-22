# Kubernetes Provisioning using Terraform

I have a script for the provisioning of Cloud Kubernetes Cluster using Terraform



# AWS Credential Setup

* How Generate access key ID & Secret access key

* Go to AWS Console > IAM > users (add user)

* user name = ""
* programmatic access = True

* Attached relevant policies

* Download or Copy access key ID & Secret access key

#


# 4 OPTIONS
## 1. Export Secrets
``` 
export AWS_ACCESS_KEY_ID="<access-key-ID>"

export AWS_SECRET_ACCESS_KEY="<Secret-access-key>"
```

#


## 2. Profiles
From the **HOME** directory on my local machine

``` mkdir .aws ```

``` cd .aws ```

``` touch credentials ```
```
#vim credential
[terraform-user]
aws_access_key_id=<access-key-id>
aws_secret_access_key=<Secret-access-key>

[other-profile]
aws_access_key_id=<access-key-id>
aws_secret_access_key=<Secret-access-key>
```
You can now export the profiles

``` export AWS_PROFILE=terraform-user ```
#
## 3. AWS CLI

Download and install aws-cli command tool unto your local machine.
Then go to your terminal run the coammand
``` aws configure``` and follow the instructions that follows
```
aws configure
aws_access_key_id=<access-key-id>
aws_secret_access_key=<Secret-access-key>
```
#

## 4. AWS CLI PROFILE (My preferred)

Download and install aws-cli command tool on your local machine.
Then go to your terminal run the coammand:
 
 ``` aws configure --profile <profile-name> ```

and follow the instructions that follows:
```
aws configure --profile terraform-user
aws_access_key_id=<access-key-id>
aws_secret_access_key=<Secret-access-key>
```

To test if it works?

``` 
aws s3 ls --profile terraform-user
```

The command above will list all s3 buckets on the aws account