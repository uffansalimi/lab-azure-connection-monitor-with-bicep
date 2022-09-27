@description('Unique name (within the Resource Group) for the Action group.')
param actionGroupName string

@description('Short name (maximum 12 characters) for the Action group.')
param actionGroupShortName string

param smsReceivers array = []
param emailReceivers array = []
param webhookReceivers array = []
param eventHubReceivers array = []

resource actionGroupName_resource 'Microsoft.Insights/actionGroups@2021-09-01' = {
  name: actionGroupName
  location: 'Global'
  properties: {
    groupShortName: actionGroupShortName
    enabled: true
    smsReceivers: smsReceivers
    emailReceivers: emailReceivers
    webhookReceivers: webhookReceivers
    eventHubReceivers: eventHubReceivers
  }
}

output actionGroupId string = actionGroupName_resource.id
