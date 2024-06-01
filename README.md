# Azure ARM Templates

Welcome to the Azure ARM Templates repository! This repository contains a collection of Azure Resource Manager (ARM) templates for deploying various resources in Microsoft Azure.

## Repository Structure

The repository is organized into the following folders:

- **VMs**: Contains ARM templates for deploying virtual machines (VMs) with different configurations.
- **Storage**: Contains ARM templates for creating Azure storage resources such as storage accounts and containers.
- **Networking**: Includes ARM templates related to Azure networking resources like virtual networks, subnets, and network security groups (NSGs).
- **WebApps**: Contains ARM templates for deploying Azure Web Apps and related resources.
- **Databases**: Includes ARM templates for deploying Azure database services such as Azure SQL Database and Cosmos DB.

## Prerequisites

Before deploying any ARM templates from this repository, ensure you have the following:

- An Azure subscription.
- Azure CLI installed on your local machine (version 2.0 or later).
- Basic understanding of Azure resource management and ARM templates.

## Usage

Follow these steps to deploy resources using the ARM templates in this repository:

1. **Clone the Repository**

   Clone this repository to your local machine using Git:

   ```bash
   git clone https://github.com/Noor-Ahmed-12/Azure-ARM-Templates.git
   cd Azure-ARM-Templates
   ```

2. **Log in to Azure**

   Log in to your Azure account using the Azure CLI:

   ```bash
   az login
   ```

3. **Select Subscription (if applicable)**

   If you have multiple Azure subscriptions, select the desired subscription:

   ```bash
   az account set --subscription "<your-subscription-id>"
   ```

4. **Choose Template**

   Navigate to the relevant folder (e.g., `VMs`, `Storage`) containing the ARM template you want to deploy.

5. **Deploy Template**

   Use the Azure CLI to deploy the ARM template. Replace `<your-resource-group>` with your desired resource group name and adjust other parameters as needed:

   ```bash
   az deployment group create --resource-group <your-resource-group> --template-file <template-file.json> --parameters <parameters-file.json>
   ```

6. **Access Deployed Resources**

   Once the deployment is complete, access your Azure portal to manage and interact with the deployed resources.

## Cleanup

To remove the deployed resources and associated resource group, use the Azure CLI:

```bash
az group delete --name <your-resource-group> --yes --no-wait
```

## Contribution

Contributions to enhance existing ARM templates or add new templates are welcome! Please submit a pull request.
