#!/bin/sh

echo "Starting docker community edition install..."
echo "Removing any old instances of docker and installing dependencies"
apt remove -y docker docker-engine docker.io containerd runc
apt update
apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

echo "Dowloading latest docker and adding official GPG key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

echo "Pulling the latest repository"
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt update

echo "Installing docker community edition"
apt install -y docker-ce docker-ce-cli containerd.io

echo "Docker install completed, installing docker-compose"

echo "Dowloading docker-compose 1.25.5 - be sure to update to the latest stable"
curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

echo "Setting binary permissions"
chmod +x /usr/local/bin/docker-compose

echo “Docker and docker-compose install complete”

# Run docker as non-root user on Ubuntu
sudo usermod -aG docker $USER