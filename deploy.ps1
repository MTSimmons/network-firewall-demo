$StartDate = Get-Date -f 'yyyyMMdd-HHmmss'

Select-AzSubscription -Subscription "df23c400-7a2f-4f25-bae4-0e5e26ea562e"

New-AzSubscriptionDeployment -Name "Deploy-$StartDate" -Location 'eastus' -TemplateFile ".\main.bicep" -TemplateParameterFile ".\main.params.json"