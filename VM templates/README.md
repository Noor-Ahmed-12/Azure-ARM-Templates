# Azure Virtual Machine Deployment with NGINX using ARM Template

This repository contains an Azure Resource Manager (ARM) template and an NGINX installation script to deploy an Azure virtual machine (VM) with NGINX installed.

## Prerequisites

Before you begin, ensure you have the following:

- Azure Subscription
- Azure CLI installed (version 2.0 or later)

## Repository Structure

The repository is structured as follows:

- `azuredeploy.json`: ARM template file for deploying the Azure resources.
- `nginx-script.sh`: NGINX installation script.
- `README.md`: This README file.

## Deployment Steps

Follow these steps to deploy the Azure VM with NGINX:

1. **Clone the Repository**

   Clone this repository to your local machine:

   ```bash
   git clone https://github.com/Noor-Ahmed-12/Azure-ARM-Templates/tree/master/VM%20templates
   cd Azure-VM-NGINX
   ```

2. **Log in to Azure**

   Log in to your Azure account using the Azure CLI:

   ```bash
   az login
   ```

3. **Set Variables**

   Update the variables in the `azuredeploy.json` file according to your deployment requirements. Variables may include resource names, locations, and credentials.

4. **Create Resource Group**

   If you do not have an existing resource group, create one using the Azure CLI:

   ```bash
   az group create --name <your-resource-group> --location <azure-region>
   ```

5. **Deploy the ARM Template**

   Deploy the ARM template using the Azure CLI:

   ```bash
   az deployment group create --resource-group <your-resource-group> --template-file azuredeploy.json --parameters <parameters-file>
   ```

6. **Access the Virtual Machine**

   Once the deployment is complete, access your Azure portal to get the public IP address or DNS name of your virtual machine. You can then SSH into the VM using the provided credentials.

## Accessing NGINX on the Virtual Machine

To access NGINX running on the virtual machine through your browser, follow these additional steps:

1. **Open Port 80 (HTTP) in Network Security Group (NSG)**

   Use the Azure CLI to open port 80 for HTTP traffic in the Network Security Group associated with your VM:

   ```bash
   az network nsg rule create --resource-group <your-resource-group> --nsg-name <your-nsg-name> --name AllowHTTP --priority 100 --source-address-prefix "*" --source-port-range "*" --destination-address-prefix "*" --destination-port-range 80 --access Allow --protocol Tcp --description "Allow HTTP traffic"
   ```

2. **Get Public IP Address of the Virtual Machine**

   Use the following Azure CLI command to retrieve the public IP address of your virtual machine:

   ```bash
   az vm show --resource-group <your-resource-group> --name <your-vm-name> --query publicIps --output tsv
   ```

3. **Access NGINX in Your Browser**

   After opening port 80 and obtaining the public IP address, enter the public IP address or DNS name associated with your VM in your web browser to access NGINX running on the VM.

## Custom Script Extension for NGINX Installation

The ARM template includes a Custom Script Extension (`installnginx`) to automatically install NGINX on the virtual machine after deployment. The extension uses the `nginx-script.sh` file hosted in this repository.

## Cleanup

To remove the resource group and all associated resources, use the Azure CLI:

```bash
az group delete --name <your-resource-group> --yes --no-wait
```

## Contribution

Contributions to enhance the ARM template or NGINX installation script are welcome! Please submit a pull request.

## License

This project is licensed under the MIT License.
