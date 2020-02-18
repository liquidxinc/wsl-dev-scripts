#! /usr/bin/env bash

# For colors, see https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
GRAY='\033[1;30m'
NC='\033[0m' # No Color

echo -e "\n${RED}Running installation of Kompose...${NC}\n"

VERSION="1.20.0"

# Linux
curl -L https://github.com/kubernetes/kompose/releases/download/v${VERSION}/kompose-linux-amd64 -o kompose

chmod +x kompose
sudo mv ./kompose /usr/local/bin/kompose

echo -e "${GREEN}Go installation complete.${NC}\n"