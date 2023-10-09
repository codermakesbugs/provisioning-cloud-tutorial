#!/bin/bash

set -e
set -v

# change to /tmp so that the command will not failed if they create any file in current directory.
cd /tmp

# install essential tools.
apt update

apt install \
    --no-install-recommends \
    -y \
    uuid-dev \
    libcurl4-openssl-dev \
    git-filter-repo \
    libgtk2.0-0 \
    libgtk-3-0 \
    libgbm-dev \
    libnotify-dev \
    libgconf-2-4 \
    libnss3 \
    libxss1 \
    libasound2 \
    libxtst6 \
    xauth \
    xvfb \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    net-tools \
    wget \
    sudo \
    openssh-server \
    openjdk-17-jdk openjdk-17-jre

curl -fL https://install-cli.jfrog.io | sh
chmod +x /usr/local/bin/jf

# Setup jfrog-cli-v2-jf for arm64 architecture. If use linux/amd64 can install without it.
wget -qO - https://releases.jfrog.io/artifactory/jfrog-gpg-public/jfrog\_public\_gpg.key | sudo apt-key add -
echo "deb https://releases.jfrog.io/artifactory/jfrog-debs xenial contrib" | sudo tee -a /etc/apt/sources.list;
apt update;
apt install -y jfrog-cli-v2-jf;


mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt update
apt install \
    --no-install-recommends \
    -y \
    docker-ce-cli

useradd -m -u 1000 jenkins
# Add group docker and assign it to user jenkins
groupadd -g 138 docker
usermod -aG docker jenkins