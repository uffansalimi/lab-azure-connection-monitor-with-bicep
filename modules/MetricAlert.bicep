param alertsName string
param description string
param networkWatcherId string
param actionGroupId string
param location string
param criteria object
param evaluationFrequency string = 'PT1M'
param windowSize string = 'PT5M'
param severity int = 0


resource metricAlerts_resource 'microsoft.insights/metricAlerts@2018-03-01' = {
  name: alertsName
  location: 'global'
  properties: {
    description: description
    severity: severity
    enabled: true
    scopes: [
      '${networkWatcherId}/connectionMonitors/NetworkMonitoring'
    ]
    evaluationFrequency: evaluationFrequency
    windowSize: windowSize
    criteria: criteria
    autoMitigate: true
    targetResourceType: 'Microsoft.Network/networkWatchers/connectionMonitors'
    targetResourceRegion: location
    actions: [
      {
        actionGroupId: actionGroupId
        webHookProperties: {
        }
      }
    ]
  }
}
