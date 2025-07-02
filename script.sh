param (
    [string]$resourceGroup,
    [string]$storageAccount
)

$containerNamelist = @()

# Get the storage account key
$key = az storage account keys list `
    --resource-group $resourceGroup `
    --account-name $storageAccount `
    --query "[0].value" -o tsv

$count = [int](Read-Host "enter the number of containers you want to create")
for ( $index = 0; $index -lt $count; $index++ )
{
  $containerNamelist += Read-Host "enter the name for container"
}

foreach ( $name in $containerNamelist )
{
  if (![string]::IsNullOrWhiteSpace($name))
  {
    # Create the blob container
    az storage container create `
        --name $name `
        --account-name $storageAccount `
        --account-key $key
  }
}