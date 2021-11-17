targetScope = 'subscription'

param StartDate string = utcNow('yyyyMMdd-HHmmss')
param DemoName string = 'netfirewalldemo'
param HubLocation string = 'eastus'
param HubAddressPrefixes array 
param HubSubnets array
param SpokeLocation string = 'westus'
param SpokeAddressPrefixes array 
param SpokeSubnets array

// Create resource groups for the hub and the spoke

resource HubRG 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${DemoName}-${HubLocation}-Net1'
  location: HubLocation
}

resource SpokeRG 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${DemoName}-${SpokeLocation}-Net1'
  location: SpokeLocation
}

// Deploy Networks

module Hub 'modules/network.bicep' = {
  name: 'DeployHub-${StartDate}'
  scope: HubRG
  params: {
    VnetName: '${DemoName}-${uniqueString(HubRG.name)}'
    AddressPrefixes: HubAddressPrefixes
    Location: HubLocation
    Subnets: HubSubnets
  }  
}

module Spoke 'modules/network.bicep' = {
  name: 'DeploySpoke-${StartDate}'
  scope: SpokeRG
  params: {
    VnetName: '${DemoName}-${uniqueString(SpokeRG.name)}'
    AddressPrefixes: SpokeAddressPrefixes
    Location: SpokeLocation
    Subnets: SpokeSubnets
  }  
}
