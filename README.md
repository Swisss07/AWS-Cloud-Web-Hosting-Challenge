# AWS Cloud Web Hosting Challenge 🚀

A scalable web application deployed on AWS cloud infrastructure utilizing an automated CI/CD pipeline.

## 🌐 Live Website
* **URL:** [http://13.236.66.42](http://13.236.66.42)
* **Project:** Tideline (An interactive field guide to the rocky shore)

---

## 🛠️ Architecture & Technology Stack

* **Cloud Provider:** Amazon Web Services (AWS)
* **Compute:** Amazon EC2 (`Ubuntu 24.04 LTS`)
* **Web Server:** Nginx
* **Networking & Security:** AWS Security Groups configured for HTTP (`Port 80`) and SSH (`Port 22`) access.
* **CI/CD Automation:** GitHub Actions workflow connected via SSH keys to automatically sync and deploy code changes upon every push to the `main` branch.

---

## ⚙️ Deployment Pipeline (`deploy.yml`)

The automated workflow checks out the code, securely connects to the EC2 instance via SSH, updates the Nginx web root directory (`/var/www/html`), sets correct file permissions, and restarts the web server seamlessly.

```yaml
name: Deploy Website to AWS EC2

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Deploy to EC2 via SSH
        uses: appleboy/ssh-action@master
        with:
          host: ${{ secrets.EC2_HOST }}
          username: ubuntu
          key: ${{ secrets.EC2_SSH_KEY }}
          script: |
            sudo mkdir -p /var/www/html
            sudo rm -rf /var/www/html/*
            sudo cp -r * /var/www/html/
            sudo chown -R www-data:www-data /var/www/html
            sudo chmod -R 755 /var/www/html
            sudo systemctl restart nginx
