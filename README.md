# Terraform Assignment 

This repository contains the Terraform configuration files for provisioning a comprehensive Azure infrastructure. The infrastructure includes resource groups, virtual networks, subnets, network security groups, log analytics workspaces, recovery services vaults, storage accounts, virtual machines, data disks, load balancers, and a PostgreSQL database.

## Modules

1. rgroup-HumberID: Provisions a resource group named `HumberIDRG`.
2. network-HumberID: Provisions a virtual network `HumberID-VNET` and subnet `HumberID-SUBNET` within the resource group, along with a network security group with rules for ports 22, 3389, 5985, and 80.
3. common-HumberID: Provisions a log analytics workspace, a recovery services vault, and a storage account.
4. vmlinux-HumberID: Provisions three CentOS 8.2 Linux VMs with public IP addresses and necessary extensions.
5. vmwindows-HumberID: Provisions a Windows Server 2016 VM with a public IP address and an Antimalware extension.
6. datadisk-HumberID: Provisions and attaches four 10GB data disks to the VMs.
7. loadbalancer-HumberID: Provisions a public-facing load balancer with the Linux VMs behind it.
8. database-HumberID: Provisions an Azure PostgreSQL database instance.

## Root Module

The root module (`assignment1-HumberID`) orchestrates all the child modules, ensuring seamless deployment and interconnectivity between the resources. 

## Usage

1. Initialize the Terraform configuration:
   ```sh
   terraform init
   ```

2. Validate the configuration:
   ```sh
   terraform validate
   ```

3. Plan the deployment:
   ```sh
   terraform plan
   ```

4. Apply the configuration:
   ```sh
   terraform apply --auto-approve
   ```

## Post-Provisioning

After successful deployment, validate the infrastructure:
1. Run `terraform state list | nl` to ensure exactly 48 lines of resources.
2. Run `terraform output` to view the outputs of the deployment.

## License

This project is licensed under the MIT License.
