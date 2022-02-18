#############################
# Author: Waleed Khan #######
# Date: 27th November 2021 ##
#############################

# Installing Terraform on Linux CentOS 8.

> sudo yum install -y yum-utils
> sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
> sudo yum -y install terraform

# Verify Installation:
> terraform  version

# Install azure-cli on CentOS 8.
> rpm --import https://packages.microsoft.com/keys/microsoft.asc

> sh -c 'echo -e "[azure-cli]
name=Azure CLI
baseurl=https://packages.microsoft.com/yumrepos/azure-cli
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/azure-cli.repo'

> yum install azure-cli

Please use your own subsciption for this :)
