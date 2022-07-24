# Qualys Container Security Demo
Qualys Container Security Demo on Azure Cloud. 

![tf-qcs-aks-acr-azdo](https://user-images.githubusercontent.com/12005983/180643185-6ab85d6a-def0-40a2-9a2c-4e6700c12343.svg)

NOTE : This demo is tested on macOS (Apple M1 Pro chip) and Linux. 

# Prerequisite
Below tools are required to setup and configure Qualys Container Security, Proof of concept/value (POC/POV) & Demonstration (demo).
| Azure Cloud Account      | Azure DevOps Account          | 
| ------------- |:-------------:|
| Azure Command-Line Interface (CLI) | terraform                          |
|           docker                   | git                                |

# Terraform 
Terraform module is not used for this POC/Demo setup for simplicity and easy understanding. 
  Terraform module is a container for multiple resources that are used together. Modules can be used to create lightweight abstractions, so that you can describe your infrastructure in terms of its architecture, rather than directly in terms of physical objects.

## Configure
### terraform.tfvars
Input variables let you customize aspects of Terraform modules without altering the module's own source code. This allows you to share modules across different Terraform configurations, making your module composable and reusable.

### Authentication to Cloud 
There are various methods for cloud authentication and based on the setup it would need to be configured in Terraform. 

# License
THIS SCRIPT IS PROVIDED TO YOU "AS IS." TO THE EXTENT PERMITTED BY LAW, QUALYS HEREBY DISCLAIMS ALL WARRANTIES AND LIABILITY FOR THE PROVISION OR USE OF THIS SCRIPT. IN NO EVENT SHALL THESE SCRIPTS BE DEEMED TO BE CLOUD SERVICES AS PROVIDED BY QUALYS

