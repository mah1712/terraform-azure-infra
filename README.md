# Terraform Azure Infrastructure Project

## Overview

This project provisions a secure production-style Azure infrastructure on Microsoft Azure using Terraform modular architecture.

The infrastructure includes:

- Azure Virtual Network
- Azure Firewall
- Internal Load Balancer
- Linux Virtual Machines
- Azure Bastion
- Azure Key Vault
- Private Endpoint
- Azure Storage Account
- Log Analytics Workspace
- Azure Monitor Alerts
- NSG & UDR Configuration

---

# High Level Architecture (HLD)


---

# Low Level Architecture (LLD)

## Network Design

| Component | CIDR |
|---|---|
| dev-vnet | 10.0.0.0/16 |
| lb-subnet | 10.0.1.0/24 |
| web-subnet | 10.0.2.0/24 |
| db-subnet | 10.0.3.0/24 |
| AzureBastionSubnet | 10.0.4.0/27 |
| AzureFirewallSubnet | 10.0.5.0/24 |

---

# Features Implemented

- Azure Firewall-based traffic control
- Internal Load Balancer
- Bastion-based secure administration
- Private Key Vault access
- NSG-based subnet security
- UDR-based outbound routing
- Log Analytics monitoring
- Azure Monitor alerts
- Terraform modular deployment

---

# Project Structure

```bash
terraform-project/
│
├── environments/
│   └── dev/
│       ├── backend.tf
│       ├── provider.tf
│       ├── versions.tf
│       ├── main.tf
│       ├── outputs.tf
│       ├── variables.tf
│       └── terraform.tfvars
│
├── modules/
│   ├── compute/
│   ├── network/
│   ├── security/
│   ├── monitoring/
│   └── storage-account/
│
├── images/
│   ├── hld.png
│   └── lld.png
│
└── README.md
```

---

# Prerequisites

Before deploying the infrastructure, ensure the following tools and resources are available.

## Required Tools

- Terraform >= 1.5.0
- Azure CLI
- Visual Studio Code
- Git

---

# Azure Requirements

- Active Azure Subscription
- Contributor access on Subscription or Resource Group

---

# Backend Prerequisites

Terraform Remote Backend requires the following Azure resources to be created manually before deployment:

- Resource Group
- Storage Account
- Blob Container

---

# Example Backend Resources

| Resource | Example |
|---|---|
| Resource Group | tfstate-rg |
| Storage Account | tfstateprod001 |
| Container | tfstate |

---

# Backend Configuration

Update the following values inside:

```bash
environments/dev/backend.tf
```

```hcl
terraform {

  backend "azurerm" {

    resource_group_name  = "tfstate-rg"

    storage_account_name = "tfstateprod001"

    container_name       = "tfstate"

    key                  = "dev.tfstate"
  }
}
```

---

# Update terraform.tfvars

Update environment-specific values inside:

```bash
environments/dev/terraform.tfvars
```

Example:

- Resource names
- Region
- CIDR ranges
- VM names
- Storage account names
- Email addresses

---

# Azure Authentication

Login to Azure before deployment:

```bash
az login
```

---

# Terraform Deployment Steps

## Initialize Terraform

```bash
terraform init
```

---

## Validate Configuration

```bash
terraform validate
```

---

## Review Execution Plan

```bash
terraform plan
```

---

## Deploy Infrastructure

```bash
terraform apply
```

---


# Terraform Modules

```text
modules/
│
├── compute/
│   ├── NIC
│   ├── virtual-machine
│   └── loadbalancer
│
├── network/
│   ├── vnet
│   ├── subnet
│   ├── firewall
│   ├── bastion
│   ├── nsg
│   └── udr
│
├── security/
│   ├── keyvault
│   ├── private-endpoint
│   └── private-dns
│
├── monitoring/
│   ├── log-analytics
│   └── alert
│
└── storage-account/
```

---

# Future Enhancements

- Application Gateway + WAF
- AKS Deployment
- CI/CD Pipeline
- Private Storage Endpoint
- Multi-Environment Deployment
- Disaster Recovery Architecture

---

# Author

Mahendra Kumar

Azure | Terraform | DevOps | Infrastructure Automation
