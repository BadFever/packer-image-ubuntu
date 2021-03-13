try {
    Write-Host "Connect to vCenter Server: $env:VIServer"
    Connect-VIServer -Server $env:VIServer -User $env:User -Password $env:PW -ErrorAction Stop | Out-Null
}
catch {
    Write-Error "Failed to connect to vCenter server '$env:VIServer' with user '$env:User'"
}

try {
    $VirtualMachine = @(Get-Datacenter -Name $env:Datacenter | Get-VM -Name $env:VMName)

    if ($VirtualMachine -and $VirtualMachine.Length -eq 1) {
        Write-Host "Found virtual machine from current build:"
        $VirtualMachine | Select-Object -Property Name
        Write-Host "Deleting virtual machine"
        $VirtualMachine | Remove-VM -DeletePermanently -Confirm:$false
    }
    else {
        Write-Host "Could not find current virtual machine"
    }

    Write-Host "Finished. Disconnecting"
    Disconnect-VIServer -Server $env:VIServer -Force -Confirm:$false

}
catch {
    Write-Error "Error deleting virtual machine"
    Disconnect-VIServer -Server $env:VIServer -Force -Confirm:$false
}