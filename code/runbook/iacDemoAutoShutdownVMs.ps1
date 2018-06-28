# user input for rg name
param(
    [parameter(Mandatory=$true)]
    [string]$rgName
)

$subId = Get-AutomationVariable -Name 'AzureSubscriptionId'

#connect to azure
$conn = Get-AutomationConnection -Name 'AzureRunAsConnection'

Add-AzureRmAccount `
    -ServicePrincipal `
    -TenantId $conn.TenantId `
    -ApplicationId $conn.ApplicationId `
    -CertificateThumbprint $conn.CertificateThumbprint

Set-AzureRmContext -SubscriptionId $subId

# retreive all VMs that match the rg name
$vms = Get-AzureRmVM | where {$_.ResourceGroupName -like $rgName}

foreach($vm in $vms){
    $status = $vm | Stop-AzureRmVM -Force -ErrorAction "Continue"

    if($status.Status -ne "Succeeded"){
        Write-Output ($vm.Name + " failed to stop")
    }
    else{
        Write-Output ($vm.Name + " successfully stopped")
    }
    
}


#turn off machines