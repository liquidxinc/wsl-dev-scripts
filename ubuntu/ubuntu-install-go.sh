#! /usr/bin/env bash

# For colors, see https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
GRAY='\033[1;30m'
NC='\033[0m' # No Color

echo -e "\n${RED}Running installation of Go...${NC}\n"

# Save current directory
CURRENT_DIR=$(pwd)

# Set version to download
VERSION="1.14"

cd ~

#Install Go
wget "https://dl.google.com/go/go${VERSION}.linux-amd64.tar.gz"
sudo tar -xvf "go${VERSION}.linux-amd64.tar.gz"
sudo mv go /usr/local

# Setup Go environment
# Make sure it is not already added to ./profile

SEARCHLINE='GOROOT=/usr/local/go'

LINE0='export GOROOT=/usr/local/go'
LINE1='export GOPATH=$HOME/Projects/Proj1'
LINE2='export PATH=$GOPATH/bin:$GOROOT/bin:$PATH'

WRITEFILE="\n$LINE0\n$LINE1\n$LINE2"

if ! grep -qF "$SEARCHLINE" ~/.profile
then
  echo -e "$WRITEFILE" >> ~/.profile
fi

source ~/.profile

rm *.gz

go version
go env

# Install Go dependency management tool
sudo apt-get install go-dep -y

# Install Bombardier for HTTP testing
go get -u github.com/codesenberg/bombardier

# Set back to original current directory
cd "$CURRENT_DIR"

echo -e "${GREEN}Go installation complete.${NC}\n"
