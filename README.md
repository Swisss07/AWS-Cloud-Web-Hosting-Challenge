# AWS Cloud Web Hosting Challenge 🚀

A scalable web application deployed on AWS cloud infrastructure utilizing an automated CI/CD pipeline.

## 🌐 Live Website
- **URL:** [Live Demo](http://3.26.145.30)
- **Project:** Tideline (An interactive field guide to the rocky shore)

## 🛠️ Architecture & Technology Stack
- **Cloud Provider:** Amazon Web Services (AWS)
- **Compute:** Amazon EC2 (Ubuntu 22.04 LTS)
- **Web Server:** Apache / Nginx
- **Networking & Security:** AWS Security Groups configured for HTTP (Port 80) and SSH (Port 22) access.
- **CI/CD Automation:** GitHub Actions workflow connected via SSH keys to automatically sync and deploy code changes upon every push to the `main` branch.
- **Containerization:** Docker support using a lightweight Nginx container image.

## ⚙️ Deployment Pipeline (`deploy.yml`)
The automated workflow checks out the code, securely connects to the EC2 instance via SSH using repository secrets (`EC2_SSH_KEY`, `HOST_DNS`, `USERNAME`, `TARGET_DIR`), and deploys updates seamlessly without manual intervention.

## 📂 Repository Structure
- `.github/workflows/deploy.yml` — Automated GitHub Actions CI/CD deployment configuration.
- `Dockerfile` — Containerization setup using Nginx.
- `index.html` & project assets — Main interactive web application files.
