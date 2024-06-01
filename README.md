# Azure Storage Account ARM Template

This repository contains Azure Resource Manager (ARM) templates to deploy Azure Storage Accounts with various configurations, including user-defined storage tier, storage kind, access tier, and other options.

## Prerequisites

- Azure Subscription
- Azure CLI installed (version 2.0 or later)

## Template Parameters

- `azureStorageType`: Specifies the storage tier. Allowed values are `Standard` and `Premium`. The default value is `Premium`.
- `skuName`: Specifies the storage SKU name. Allowed values include `Standard_LRS`, `Standard_GRS`, `Standard_RAGRS`, `Standard_ZRS`, `Premium_LRS`, and `Premium_ZRS`.
- `storageKind`: Specifies the kind of storage account. Allowed values are `Storage`, `StorageV2`, `BlobStorage`, `FileStorage`, and `BlockBlobStorage`.
- `accessTier`: Specifies the access tier used for billing. Allowed values are `Hot` and `Cool`. Default value is `Hot`.
- `enableBlobPublicAccess`: Allows or disallows public access to all blobs or containers in the storage account. Default value is `true`.
- `minimumTlsVersion`: Sets the minimum TLS version to be permitted on requests to storage. Allowed values are `TLS1_0`, `TLS1_1`, and `TLS1_2`. Default value is `TLS1_2`.
- `allowSharedKeyAccess`: Allows or disallows Shared Key access. Default value is `true`.
- `networkAcls`: Configures network access rules, including IP rules and virtual network rules.

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

Use the following command to deploy the ARM template. Replace `<your-resource-group>` with your resource group name and specify the desired parameters.

```bash
az deployment group create --resource-group <your-resource-group> --template-file template.json --parameters azureStorageType=<StorageType> skuName=<SkuName> storageKind=<StorageKind> accessTier=<AccessTier> enableBlobPublicAccess=<EnableBlobPublicAccess> minimumTlsVersion=<MinimumTlsVersion> allowSharedKeyAccess=<AllowSharedKeyAccess> networkAcls=<NetworkAcls>
```

Example:

```bash
az deployment group create --resource-group myResourceGroup --template-file template.json --parameters azureStorageType=Standard skuName=Standard_LRS storageKind=StorageV2 accessTier=Hot enableBlobPublicAccess=true minimumTlsVersion=TLS1_2 allowSharedKeyAccess=true networkAcls=@networkAcls.json
```

## Template Structure

### Basic Storage Account Template

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "azureStorageType": {
            "type": "string",
            "metadata": {
                "description": "Storage tier"
            },
            "defaultValue": "Premium",
            "allowedValues": [
                "Standard",
                "Premium"
            ]
        },
        "skuName": {
            "type": "string",
            "metadata": {
                "description": "Storage SKU name"
            },
            "defaultValue": "Premium_LRS",
            "allowedValues": [
                "Standard_LRS",
                "Standard_GRS",
                "Standard_RAGRS",
                "Standard_ZRS",
                "Premium_LRS",
                "Premium_ZRS"
            ]
        },
        "storageKind": {
            "type": "string",
            "metadata": {
                "description": "The kind of storage account"
            },
            "defaultValue": "StorageV2",
            "allowedValues": [
                "Storage",
                "StorageV2",
                "BlobStorage",
                "FileStorage",
                "BlockBlobStorage"
            ]
        },
        "accessTier": {
            "type": "string",
            "metadata": {
                "description": "The access tier used for billing"
            },
            "defaultValue": "Hot",
            "allowedValues": [
                "Hot",
                "Cool"
            ]
        },
        "enableBlobPublicAccess": {
            "type": "bool",
            "metadata": {
                "description": "Allow or disallow public access to all blobs or containers in the storage account"
            },
            "defaultValue": true
        },
        "minimumTlsVersion": {
            "type": "string",
            "metadata": {
                "description": "Set the minimum TLS version to be permitted on requests to storage"
            },
            "defaultValue": "TLS1_2",
            "allowedValues": [
                "TLS1_0",
                "TLS1_1",
                "TLS1_2"
            ]
        },
        "allowSharedKeyAccess": {
            "type": "bool",
            "metadata": {
                "description": "Allow or disallow Shared Key access"
            },
            "defaultValue": true
        },
        "networkAcls": {
            "type": "object",
            "metadata": {
                "description": "Network ACLs for the storage account"
            },
            "defaultValue": {
                "bypass": "AzureServices",
                "defaultAction": "Allow",
                "ipRules": [],
                "virtualNetworkRules": []
            }
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
            "kind": "[parameters('storageKind')]",
            "sku": {
                "name": "[parameters('skuName')]",
                "tier": "[parameters('azureStorageType')]"
            },
            "properties": {
                "accessTier": "[parameters('accessTier')]",
                "allowBlobPublicAccess": "[parameters('enableBlobPublicAccess')]",
                "minimumTlsVersion": "[parameters('minimumTlsVersion')]",
                "allowSharedKeyAccess": "[parameters('allowSharedKeyAccess')]",
                "networkAcls": "[parameters('networkAcls')]"
            }
        }
    ],
    "outputs": {}
}
```

### Simple Storage Account Template

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
