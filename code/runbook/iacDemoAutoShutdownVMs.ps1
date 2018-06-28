# user input for rg name
param(
    [parameter(Mandatory=$true)]
    [string]$rgName
)

$subId = Get-AutomationVariable -Name 'AzureSubscriptionId'
$conn = Get-AutomationConnection -Name 'AzureRunAsConnection'

#connect to azure


# retreive all VMs that match the rg name


#turn off machines