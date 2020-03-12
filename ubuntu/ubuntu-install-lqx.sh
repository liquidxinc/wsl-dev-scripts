#! /usr/bin/env bash

# For colors, see https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
GRAY='\033[1;30m'
NC='\033[0m' # No Color

echo -e "\n${RED}Running installation of Liquid X tools...${NC}\n"

# Save current directory
CURRENT_DIR=$(pwd)

cd ~

sudo apt install curl -y

# Install Jenkins X binary
curl -L "https://github.com/jenkins-x/jx/releases/download/$(curl --silent "https://github.com/jenkins-x/jx/releases/latest" | sed 's#.*tag/\(.*\)\".*#\1#')/jx-linux-amd64.tar.gz" | \
tar xzv "jx"
chmod 700 ./jx
sudo mv ./jx /usr/local/bin/jx
echo -e "\n${GREEN}JX version: $(jx --version).${NC}\n"

# Install k9s
mkdir k9s
curl -Ls https://github.com/derailed/k9s/releases/latest/download/k9s_Linux_x86_64.tar.gz --output k9s/k9s.tar.gz
tar -xzvf ./k9s/k9s.tar.gz -C ./k9s
chmod 700 ./k9s/k9s
sudo mv ./k9s/k9s /usr/local/bin/k9s
rm -rf k9s

echo -e "\n${GREEN}$(k9s version).${NC}\n"

# Set back to original current directory
cd "$CURRENT_DIR"

echo -e "\n${GREEN}Liquid X tools installation complete.${NC}\n"
