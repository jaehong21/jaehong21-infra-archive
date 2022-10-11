# Terraform

Terraform is an open-source infrastructure as code software tool that enables you to safely and predictably create, change, and improve infrastructure.

## Installation
This repository is based on AWS (GCP or AZURE is not supported)
```python
# use command below to start
terraform init
```

## Usage

uncomment ```main.tf``` to use following templates
1. NAT instance
2. k3s (Lightweight Kubernetes)
3. EKS (Elastic  Kubernetes Service)
4. ECR (Elastic Container Registry)
5. AWS Lambda (Serverless)
6. Route53
7. VPC and Subnet
```python
# module "nat" {
# source = "./module/nat"
# }


module "eks" {
 source = "./module/eks"
}
```