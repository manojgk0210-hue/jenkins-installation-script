#!/bin/bash

set -e

exec > /var/log/user-data.log 2>&1

echo "============================"
echo " Jenkins Installation"
echo "============================"

apt update -y

apt install -y fontconfig openjdk-21-jre wget

mkdir -p /etc/apt/keyrings

wget -O /etc/apt/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" > /etc/apt/sources.list.d/jenkins.list

apt update -y

apt install -y jenkins

systemctl enable jenkins
systemctl start jenkins

echo "Waiting for Jenkins to start..."

sleep 30

echo "========================================"
echo " Jenkins Installed Successfully"
echo "========================================"

PUBLIC_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)

echo "Jenkins URL:"
echo "http://$PUBLIC_IP:8080"

echo
echo "Initial Admin Password"

cat /var/lib/jenkins/secrets/initialAdminPassword

echo
echo "User Data execution completed."
