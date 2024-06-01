# Azure Storage Account ARM Template

This repository contains an Azure Resource Manager (ARM) template to deploy an Azure Storage Account with a user-defined storage tier.

## Prerequisites

- Azure Subscription
- Azure CLI installed (version 2.0 or later)

## Template Parameters

- `azureStorageType`: Specifies the storage tier. Allowed values are `Standard` and `Premium`. The default value is `Premium`.

## Deployment Steps

### 1. Clone the Repository

```bash
git clone https://github.com/Noor-Ahmed-12/Azure-ARM-Templates.git
cd Azure-ARM-Templates
```

### 2. Log in to Azure

```bash
az login
```

### 3. Select the Subscription

If you have multiple subscriptions, set the desired subscription:

```bash
az account set --subscription "<your-subscription-id>"
```

### 4. Create a Resource Group

If you do not have an existing resource group, create one:

```bash
az group create --name <your-resource-group> --location <your-location>
```

Replace `<your-resource-group>` with your desired resource group name and `<your-location>` with the Azure region (e.g., eastus, westus).

### 5. Deploy the ARM Template

Use the following command to deploy the ARM template. Replace `<your-resource-group>` with your resource group name and specify the desired storage type (`Standard` or `Premium`).

```bash
az deployment group create --resource-group <your-resource-group> --template-file template.json --parameters azureStorageType=<StorageType>
```

Example:

```bash
az deployment group create --resource-group myResourceGroup --template-file template.json --parameters azureStorageType=Standard
```

## Template Structure

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "azureStorageType": {
            "type": "string",
            "metadata": {
                "description": "storage tier"
            },
            "defaultValue": "Premium",
            "allowedValues": [
                "Standard",
                "Premium"
            ]
        }
    },
    "functions": [],
    "variables": {
        "storageName": "noor8989"
    },
    "resources": [
        {
            "name": "[variables('storageName')]",
            "type": "Microsoft.Storage/storageAccounts",
            "apiVersion": "2023-01-01",
            "tags": {
                "displayName": "[variables('storageName')]"
            },
            "location": "[resourceGroup().location]",
            "kind": "StorageV2",
            "sku": {
                "name": "[concat(parameters('azureStorageType'), '_LRS')]",
                "tier": "[parameters('azureStorageType')]"
            }
        }
    ],
    "outputs": {}
}
```

## Notes

- Ensure you have the necessary permissions to create resources in the specified resource group.
- Review the allowed locations and pricing for Azure Storage accounts.

## Cleanup

To remove the resource group and all associated resources:

```bash
az group delete --name <your-resource-group> --yes --no-wait
```

## Contribution

Contributions are welcome! Please submit a pull request.

## License

This project is licensed under the MIT License.

