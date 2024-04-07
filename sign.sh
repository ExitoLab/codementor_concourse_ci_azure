#!/bin/bash

# Function to retrieve secret from Azure Key Vault
get_secret() {
    local secret_uri=$1
    local secret_value=$(az keyvault secret show --vault-name your_keyvault_name --name "$secret_uri" --query value -o tsv)
    echo "$secret_value"
}

# Fetch the signing key and certificate from Azure Key Vault
SIGNING_KEY=$(get_secret "$SIGNING_KEY_URI")
SIGNING_CERT=$(get_secret "$SIGNING_CERT_URI")

# Set up Notary configuration
export NOTARY_ROOT_PASSPHRASE=your_root_passphrase
export NOTARY_TARGETS_PASSPHRASE=your_targets_passphrase
export NOTARY_SNAPSHOT_PASSPHRASE=your_snapshot_passphrase

# Sign the Docker image using Notary CLI
notary -s https://your.notary.server.com sign your_image_name:your_tag

# Authenticate with Azure Container Registry
az acr login --name your_acr_name

# Tag the signed Docker image for Azure Container Registry
docker tag your_image_name:your_tag your_acr_name.azurecr.io/your_image_name:your_tag

# Push the signed Docker image to Azure Container Registry
docker push your_acr_name.azurecr.io/your_image_name:your_tag




fly -t tutorial login -c http://localhost:8080 -u ptfe -p ptfe