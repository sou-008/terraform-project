# terraform-project [Flask and Express Deployment on a Single EC2 Instance using Terraform]

# Project Overview
This project demonstrates how to deploy both a Flask backend and an Express frontend on a single Amazon EC2 instance using Terraform. The goal is to provision an EC2 instance, install the necessary dependencies, and run both applications on different ports (Flask on port 5000 and Express on port 3000).

## Prerequisites
**Before starting, ensure you have the following:**
    AWS Account: An AWS account with appropriate permissions to create resources.
    Terraform: Terraform installed on your local machine.
    AWS CLI: The AWS CLI configured with your AWS credentials (aws configure).
    SSH Key: An SSH key pair created in the AWS region you're deploying the EC2 instance in (to access the EC2 instance).

/terraform-project
│
├── main.tf            # Main Terraform configuration
├── variables.tf       # Terraform variables
├── outputs.tf         # Terraform outputs
├── user_data.sh       # User data script for EC2 instance
├── README.md          # Project readme

## Terraform Configuration Files

1. `main.tf` - Terraform Configuration
This file contains the main configuration for provisioning the EC2 instance. It includes:

Defining the AWS provider and region.
Provisioning an EC2 instance with the required configurations.
Attaching a user data script to install dependencies and start both the Flask and Express applications.

2. `variables.tf` - Terraform Variables
This file contains all the variables used in the main.tf configuration. It's designed for reusability and scalability.

3. `outputs.tf` - Terraform Outputs
This file outputs the EC2 instance's public IP once the deployment is complete, allowing easy access to your application.

4. EC2 User Data Script (`user_data.sh`)
This script is executed when the EC2 instance is launched. It installs all necessary dependencies, clones the Flask and Express applications, and starts both apps on separate ports.

**This script does the following**
- Installs the required dependencies (python3, nodejs, git, Flask, and Express).
- Clones the Flask and Express applications from GitHub (ensure to replace with your own repos).
- Installs any required dependencies for both Flask (pip3 install -r requirements.txt) and Express (npm install).
- Starts the Flask backend on port 5000 and the Express frontend on port 3000.

**Steps to Deploy**
1. Set Up AWS CLI and Terraform
    <br>Install and configure the AWS CLI (aws configure).
    <br>Install Terraform if you haven't already.
    <br>Ensure your SSH key is available to use for the EC2 instance.
     
2. Initialize Terraform
- `terraform init`

3. Review the Deployment Plan
- `terraform plan`

4. Apply the Terraform Configuration
- `terraform apply`
<br>Type yes when prompted to confirm the deployment.
    
5. Access the Application
Once the deployment is complete, Terraform will output the public IP of the EC2 instance. Use this IP to access your applications:
    <br>Flask Application: http://<instance-public-ip>:5000
    <br>Express Application: http://<instance-public-ip>:3000

## Troubleshooting
<br>Ensure that your EC2 instance's security group allows inbound traffic on ports 5000 and 3000.
<br>If you face issues with dependencies, check the application logs or verify if the required packages are installed.

## Clean Up
To remove the resources created by Terraform:
- `terraform destroy`
**This will tear down the EC2 instance and other associated resources.**

## Conclusion
This project demonstrates the deployment of both Flask and Express on a single EC2 instance using Terraform. The provided configuration files and scripts ensure that both applications are installed and run on separate ports.

**Feel free to modify the configurations to suit your environment and requirements.**