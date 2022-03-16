$StartDate = Get-Date -f 'yyyyMMdd-HHmmss'

# The Subscription is usually set in the Azure PowerShell session before running this. 
#  or you can set it here (remove the comment and then either create a $SubscriptionId variable or replace the text here with the subscription id:)
#    Select-AzSubscription -Subscription $SubscriptionId

New-AzSubscriptionDeployment -Name "Deploy-$StartDate" -Location 'eastus' -TemplateFile ".\main.bicep" -TemplateParameterFile ".\main.params.json"
