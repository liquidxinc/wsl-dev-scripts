#! /usr/bin/env bash

# Run update and upgrade again to wrap up
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get autoremove -y

##### FUNCTIONS #####
# Used as script times out sudo since it runs so long,
# Use only within scripts
# Source: https://stackoverflow.com/questions/5866767/shell-script-sudo-permissions-lost-over-time

function startsudo() {
    sudo -v
    ( while true; do sudo -v; sleep 50; done; ) &
    SUDO_PID="$!"
    trap stopsudo SIGINT SIGTERM
}

function stopsudo() {
    kill "$SUDO_PID"
    trap - SIGINT SIGTERM
    sudo -k
}

##### END FUNCTIONS #####

# For colors, see https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
GRAY='\033[1;30m'
NC='\033[0m' # No Color

startsudo

echo -e "Completed initial update and upgrade.\n"

echo -e "\n${RED}Running the rest of the installations...${NC}\n"

# Install utilities
. ubuntu-install-utils.sh

# Install awsli
. ubuntu-install-awscli.sh

# Install AWS IAM Authenticator
. ubuntu-install-aws-iam-authenticator.sh

# Install 


# Install Docker
. ubuntu-install-docker.sh

# Install .NET Core 3.0 with FAKE command-line tooling
. ubuntu-install-dotnet-core-sdk.sh

# Install Azure core functions tools
. ubuntu-install-azure-functions-core-tools.sh

# Install Flyway
. ubuntu-install-flyway.sh

# Install Git-flow
. ubuntu-install-git-flow.sh

# Install Gradle
. ubuntu-install-gradle.sh

# Install Go
. ubuntu-install-go.sh

# Install Dive - Must be installed after Go
. ubuntu-install-dive.sh

# Install Kubectl, Helm, and Draft
. ubuntu-install-kubectl.sh

# Install Maven
. ubuntu-install-maven.sh

# Install MySQL client
. ubuntu-install-mysql-cli.sh

# Install Node
. ubuntu-install-node.sh

# Install OpenJDK
. ubuntu-install-openjdk-11.sh

# Install Hashicorp Packer
. ubuntu-install-packer.sh

# Install Hashicorp Packer
. ubuntu-install-packer-windows-update-plugin.sh

# Install Powershell Core
. ubuntu-install-powershell-core.sh

# Install Powershell Modules
sudo pwsh -File ubuntu-install-powershell-modules.sh

# Install Python 3.8 and update-alternatives
. ubuntu-install-python3.8-and-update-alternatives.sh

# Install Python3 pip
. ubuntu-install-python3-pip.sh

# Install Anchore CLI
# Must be installed after Python prep
. ubuntu-install-anchore-cli.sh

# Install Ruby and related tools
. ubuntu-install-ruby.sh

# Run update and upgrade again to wrap up
. ubuntu-update-and-upgrade.sh

# Install GitVersion at the end! (if not, certain libraries will be overridden from other installations)
dotnet tool install --global GitVersion.Tool --version 5.1.2-beta1.2

# Install Terraform (like GitVersion needs to be installed at the end)
. ubuntu-install-terraform.sh

# Install WSL configuration as the very last step as it binds /mnt/c to /c, and
# that does not work well halfway in an installation!
. ubuntu-install-wsl-conf.sh

# Update, upgrade, and autoremove
. ubuntu-update-and-upgrade.sh

# Install bash git prompt
. ubuntu-install-bash-git-prompt.sh

stopsudo

echo -e "${GREEN}Completed all installations.${NC}\n"
