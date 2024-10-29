# Project: Run NodeJS App in Kubernetes Environment

This repository demonstrates deploying a Node.js application, for product **Bulwark**, in a Kubernetes (K8s) environment on Azure Cloud, accessible via HTTPS. The deployment is divided into two main layers:

1. **Infrastructure Layer**
2. **Application Layer**

Deployment is fully automated using CI/CD pipelines with GitHub Actions, utilizing Terraform for Infrastructure as Code (IaC) and Helm for containerized application deployment.

---

## Table of Contents

- [Overview](#overview)
- [Infrastructure Layer](#infrastructure-layer)
- [Application Layer](#application-layer)
- [CI/CD Workflow](#cicd-workflow)

---

## Overview

Product **Bulwark** runs on a Node.js-based application designed to be containerized, deployed, and secured in a Kubernetes cluster hosted on Azure Cloud. It ensures secure HTTPS communication, supporting an automated and reproducible environment using **Terraform**, **Docker**, **Helm**, **GitHub Actions**, and **Kubernetes**.

## Infrastructure Layer

The **Infrastructure Layer** provisions and manages all required resources on Azure using **Terraform**. This layer is automated via **Terraform Cloud** and is configured to apply changes automatically when updates are merged into the `main` branch. 

### Key Components
- **Terraform Cloud**: Manages the state and applies configurations to ensure infrastructure consistency.
- **Azure Cloud**: Hosts the Kubernetes cluster and other related resources.
- **GitHub API**: Triggers Terraform Cloud to automatically apply changes from the `main` branch.

### Process
1. **Define Infrastructure**: Infrastructure configurations are stored in `.tf` files within the `infra/` directory.
2. **Terraform Workflow**: When changes are pushed to `main`, Plan and Apply will be triggered in Terraform Cloud to apply the updated configurations on Azure.
3. **Automatic Deployment**: Merges to `main` automatically apply changes to the Kubernetes infrastructure on Azure.
<img width="1251" alt="Screenshot 2024-10-29 at 19 32 22" src="https://github.com/user-attachments/assets/c95466d3-b0f6-49df-bc39-ec115cd19108">


## Application Layer

The **Application Layer** handles the building, containerization, and deployment of the Bulwark Node.js application on Kubernetes.

### Key Components
- **Docker**: Packages the Node.js application as a container image.
- **Docker Hub**: Stores and serves the Docker images used for deployment.
- **Helm**: Manages the deployment and configuration of the app within the Kubernetes environment.
- **Github Action**: Build and deploy images to AKS cluster.

### Process
1. **Build and Package**: The Node.js application is packaged as a Docker container image.
2. **Image Deployment**: The Docker image is pushed to Docker Hub, making it accessible to Kubernetes.
3. **Helm Deployment**: The application is deployed on Kubernetes using Helm charts stored in the `helm/` directory.


## CI/CD Workflow

The CI/CD pipeline is managed by **GitHub Actions and Terraform VCS Flow**, supporting application and application updates respectively.

### Workflow Details

1. **Infrastructure Updates**:
   - Changes in the `infra/` directory trigger the Terraform workflow.
   - GitHub connect to Terraform Cloud via VCS API, which deploys or updates infrastructure on Azure.
2. **Application Updates**:
   - Changes in the root directory or Dockerfile trigger the application build process.
   - The Node.js application is built, and the image is pushed to Docker Hub.
   - Helm is used to deploy the updated image on Kubernetes.
<img width="1430" alt="image" src="https://github.com/user-attachments/assets/717f4aca-6f65-417d-8a83-194a7cb345b9">


## HTTPS
1. Self-signed certificate create for FQDN paymyfavour.com manually and stored in kubernetes Secret
```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt
kubectl create secret tls bulwark-app-tls --cert=tls.crt --key=tls.key -n bulwark-app
```
2. DNS record needs to be added for domain paymyfavour.com to point to the public IP of ingress controller [NOT DONE]
