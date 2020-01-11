#! /usr/bin/env bash
# Install Packer

RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
GRAY='\033[1;30m'
NC='\033[0m' # No Color

echo -e "\n${RED}Running installation of Packer...${NC}\n"

# Set version to download
VERSION="1.5.1"

# Save current directory
CURRENT_DIR=$(pwd)

cd ~

sudo rm -rf ~/*.zip*

wget -q  "https://releases.hashicorp.com/packer/${VERSION}/packer_${VERSION}_linux_amd64.zip"

unzip "packer_${VERSION}_linux_amd64.zip"

sudo mv packer /usr/local/bin/

cd ~

sudo rm -rf ~/*.zip*

# Set back to original current directory
cd "$CURRENT_DIR"

echo -e "${GREEN}Packer installation complete.${NC}\n"
