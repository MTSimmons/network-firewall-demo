param VnetName string
param Location string = resourceGroup().location
param AddressPrefixes array = [
  '10.10.0.0/16'
]
param Subnets array = [
{
  name: 'sub0'
  properties: {
    addressPrefix:  '10.10.0.0/24'
  }
}
{
  name: 'sub1'
  properties: {
    addressPrefix:  '10.10.1.0/24'
  }
}
]

resource vnet 'Microsoft.Network/virtualNetworks@2021-03-01' = {
  name: VnetName
  location: Location
  properties: {
    addressSpace: {
      addressPrefixes: AddressPrefixes
    }    
    subnets: Subnets
  }
}
