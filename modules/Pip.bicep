param name string
param location string
param publicIpPrefixId string


resource Pip 'Microsoft.Network/publicIPAddresses@2022-01-01' = {
  name: name
  location: location
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    publicIPPrefix: {
      id: publicIpPrefixId
    }
  }
}

output id string = Pip.id
output ipAddress string = Pip.properties.ipAddress
