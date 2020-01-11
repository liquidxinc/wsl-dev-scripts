#! /usr/bin/env bash

# For colors, see https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
GRAY='\033[1;30m'
NC='\033[0m' # No Color

echo -e "\n${RED}Running installation of .NET Core SDK 3.0...${NC}\n"

# Save current directory
CURRENT_DIR=$(pwd)
cd ~

sudo dpkg --purge packages-microsoft-prod && sudo dpkg -i packages-microsoft-prod.deb

wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo add-apt-repository universe -y
sudo apt-get install apt-transport-https -y
sudo apt-get update -y
sudo apt-get install dotnet-sdk-3.0 -y
sudo apt-get install fsharp -y
sudo apt-get update -y

# Install Coverlet
dotnet tool install -g coverlet.console

# Install FAKE CLI
dotnet tool install -g fake-cli
dotnet new -i "fake-template::*"

# Install Paket
dotnet tool install -g paket

sudo rm ~/*deb*

# Set back to original current directory
cd "$CURRENT_DIR"

echo -e "${GREEN}.NET Core SDK 2.2 installation complete.${NC}\n"