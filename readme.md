# 1st Deployment(Re-Deployment) of AL-PRIVATE-CLOUD-into AWS

Requirments: 


## Step 1: Downloading the executable

Visit https://www.terraform.io/downloads.html and select your platform of choice (regardless of what you choose, you get a single executable file)

Once you have that, pop it into a directory on your machine that you are comfortable with.

## Step 2: Creating a symlink (symbolic link) to the executable

What this will allow us to do is run terraform from any location on our machine, this way you won’t have to change into the directory containing the executable in order to run your code

Mac/Ubuntu users:

### Edit ".zshrc file"

Paste the following line into the editor replacing the file path with the location to your Terraform executable

### export PATH=<PATH_TO_TERRAFORM_EXECUTABLE:$PATH

Then hit save and run the following command in terminal to load your changes into your session

### Reload zsh profile

## Step 3 (Optional alternative): Installing tfswitch with Homebrew

Thanks to Warrenbox, there is a neat tool that allows you to download and swap versions of terraform all from command line and without any additional setup. Follow the instructions over here:
https://tfswitch.warrensbox.com/
For Windows users https://docs.alfresco.com/content-services/latest/admin/troubleshoot/

## Step 4 Setting up AWS Identity Access Management
At this point you will need to Sign up for an AWS account, don’t worry it won’t cost you a penny and most of the services are free for at least 12 months (you will need a debit card). Now it’s never a good idea (nor good practice) to create users and use it directly in your Root account, more about that here. Ideally, you should create an IAM user for the project and then use that to perform all your infrastructure changes, so let’s do that first.
Once you have your account (make note of the Account ID), log in to the console and in the Services section type IAM and click the option in the drop down

## Step 5 Setting up an IAM user for Terraform
Once you are logged into your brand new Administrator IAM account, head over to IAM again and similar to the above create a user, this time selecting Programmatic Access in the options. Move onto the Permissions section and this time select the Attach existing policies directly option

## Step 6 Terraform Resources
For those of you who are unfamiliar with Terraform and it’s workings, let’s cover a few concepts quickly…

### Resource:
describes one or more infrastructure objects, this could be anything from virtual networks, compute resources or DNS records

### Terraform state:
is used to track versioning, changes and keep track of meta data about your infrastructure

### Backend configuration:
is used to initialise Terraform and generates a state file for you
Provider: responsible for understanding API interactions and exposing resources (e.g. Amazon’s API will be different to Azure/Google etc.)
Using the example provide: 

#### Region: 
Is the location of where we want our infrastructure to be deployed to (See this document for a list of available regions)

### Backend: 
as described above, initialising our state file in an S3 bucket and adding encryption for security

### Resource: defining the creation of a new S3 bucket with the name startup-chronicles-demo-account and assigning it default S3 encryption (always encrypt your data at REST using KMS)

Great, now we have a basic understanding lets see what our configuration file looks like and break down what each section means

Source:
https://medium.com/devops-dudes/setting-up-terraform-with-amazon-web-services-aws-afb2fde6cf18
