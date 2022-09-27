param resourceSuffix string
param location string = resourceGroup().location

resource publicIpPrefix 'Microsoft.Network/publicIPPrefixes@2022-01-01' = {
  name: 'ippre-${resourceSuffix}'
  location: location
  sku: {
    name: 'Standard'
    tier: 'Regional'   
  }
  properties: {
    prefixLength: 31
  }
}
output publicIpPrefixId string = publicIpPrefix.id
