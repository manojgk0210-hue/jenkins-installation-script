# Jenkins Installation Script

This repository contains shell scripts to install and configure Jenkins on Ubuntu. It includes scripts for both manual installation and automated installation using AWS EC2 User Data.

## Files

- `install-jenkins.sh` – Installs Jenkins manually on an Ubuntu server.
- `jenkins-user-data.sh` – Automatically installs and configures Jenkins during EC2 instance launch using User Data.
- `README.md` – Documentation for the installation scripts.

## Prerequisites

- Ubuntu 22.04 or later
- AWS EC2 instance
- Internet connection
- Security Group should allow:
  - **22** – SSH
  - **8080** – Jenkins Web UI

## Manual Installation

1. Create the installation script:

```bash
sudo nano install-jenkins.sh
```

2. Paste the script and save the file.

3. Make the script executable:

```bash
sudo chmod +x install-jenkins.sh
```

4. Run the script:

```bash
sudo ./install-jenkins.sh
```

## EC2 User Data Installation

1. Launch a new EC2 instance.
2. In the **Advanced details** section, paste the contents of `jenkins-user-data.sh` into the **User Data** field.
3. Launch the instance.
4. Wait 2–5 minutes for Jenkins to install and start automatically.

## Access Jenkins

Open your browser and navigate to:

```
http://<EC2-PUBLIC-IP>:8080
```

## Unlock Jenkins

Retrieve the initial administrator password:

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

Use:

- **Username:** `admin` (created during the setup wizard)
- **Password:** Use the initial administrator password displayed above.

## Useful Commands

Check Jenkins status:

```bash
sudo systemctl status jenkins
```

Start Jenkins:

```bash
sudo systemctl start jenkins
```

Stop Jenkins:

```bash
sudo systemctl stop jenkins
```

Restart Jenkins:

```bash
sudo systemctl restart jenkins
```

View Jenkins logs:

```bash
sudo journalctl -u jenkins -f
```

## Notes

- The EC2 User Data script runs automatically during instance launch.
- User Data executes as the `root` user, so `sudo` is not required in the User Data script.
- Installation logs can be found at:

```bash
/var/log/user-data.log
```

## License

This project is provided for learning and educational purposes.
