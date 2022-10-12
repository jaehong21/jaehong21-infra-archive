# Introduction

```markdown
├── management
│   ├── archive
│   └── scripts
├── platform
│   ├── init.tf
│   ├── main.tf
│   └── module
└── service
    ├── application
    └── example
        ├── cert
        ├── dev
        └── prod
```
1. **Management** <br />
    This folder contains the scripts and yaml files to manage the infrastructure. <br />
    The scripts are written in bash and are used to create the infrastructure and to destroy it. <br />
    The archive folder contains kubernetes manifest files. <br />
    <br />
2. **Platform** <br />
    This folder contains the terraform files to create the infrastructure. <br />
    `init.tf` file contains terraform provider and the backend configuration. <br />
    `main.tf` file contains the resources to create. <br />
    `module` folder contains the modules to create the infrastructure. <br />
    <br />
3. Service <br />
    This folder contains the kubernetes manifest files to deploy in ArgoCD. <br />
    `application` folder contains the ArgoCD project format in yaml files. <br />
    `example` represents one of applications in ArgoCD. <br />
    `cert` folder contains the certificate files. <br />
    `dev` folder contains the kubernetes manifest files to deploy the application in dev environment. <br />
    `prod` folder contains the kubernetes manifest files to deploy the application in prod environment. <br />

## Terraform
Terraform is an open-source infrastructure as code software tool that enables you to safely and predictably create, change, and improve infrastructure.

This repository is based on AWS (GCP or AZURE is not supported)
```shell
# use command below to start
terraform init
```

## Terraform Usage

uncomment ```main.tf``` to use following templates
1. NAT instance
2. EC2 (+ k3s) (Lightweight Kubernetes setup using EC2)
3. EKS (Elastic  Kubernetes Service)
4. ECR (Elastic Container Registry)
5. AWS Lambda (Serverless)
6. Route53
7. Key Pair
8. Lightsail 
9. VPC and Subnet
```terraform
# module "nat" {
# source = "./module/nat"
# }

module "eks" {
 source = "./module/eks"
}
```