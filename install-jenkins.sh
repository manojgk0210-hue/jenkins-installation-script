#!/bin/bash

set -e

echo "============================"
echo " Updating system packages"
echo "============================"

sudo apt update -y

echo "============================"
echo " Installing Java (OpenJDK 21)"
echo "============================"

sudo apt install -y fontconfig openjdk-21-jre wget

java -version

echo "============================"
echo " Adding Jenkins repository key"
echo "============================"

sudo mkdir -p /etc/apt/keyrings

sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

echo "============================"
echo " Adding Jenkins Repository"
echo "============================"

echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "============================"
echo " Updating package index"
echo "============================"

sudo apt update -y

echo "============================"
echo " Installing Jenkins"
echo "============================"

sudo apt install -y jenkins

echo "============================"
echo " Starting Jenkins"
echo "============================"

sudo systemctl enable jenkins
sudo systemctl start jenkins

echo
echo "========================================"
echo " Jenkins Installed Successfully"
echo "========================================"

echo "Jenkins URL"
echo "http://<EC2-PUBLIC-IP>:8080"

echo
echo "Initial Admin Password"

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo
echo "Useful Commands"

echo "sudo systemctl start jenkins"
echo "sudo systemctl stop jenkins"
echo "sudo systemctl restart jenkins"
echo "sudo systemctl status jenkins"
echo "sudo journalctl -u jenkins -f"
