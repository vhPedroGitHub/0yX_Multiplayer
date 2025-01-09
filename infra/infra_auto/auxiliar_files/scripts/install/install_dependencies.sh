#!/bin/bash
sudo apt update && sudo apt upgrade -y

# docker install
# Add Docker's official GPG key:
sudo apt-get update -y
sudo apt-get install ca-certificates curl -y
sudo install -m 0755 -d /etc/apt/keyrings

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y    

sudo docker run hello-world

curl -s https://packagecloud.io/install/repositories/akopytov/sysbench/script.deb.sh | sudo bash
sudo apt -y install sysbench

sudo apt update
sudo apt install postgresql postgresql-contrib

sudo -i -u postgres
psql

ALTER USER postgres WITH PASSWORD '12345678';
