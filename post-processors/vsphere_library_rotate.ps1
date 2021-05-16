$VIServer = $env:VIServer
$User = $env:User
$PW = $env:PW
$ContentLibrary = $env:ContentLibrary
$ContentLibraryItemName = $env:ContentLibraryItemName
$Role = $env:VMRole

$Date = Get-Date -Format FileDateTime
Import-Module VMware.PowerCLI
try {
   
    Write-Host "Connect to vCenter Server: $VIServer"
    Connect-VIServer -Server $VIServer -User $User -Password $PW -ErrorAction Stop | Out-Null
}
catch {
    Write-Error "Failed to connect to vCenter server '$VIServer' with user '$User'"
}

$ContentItemLibraryBaseName = $ContentLibraryItemName.Split('-')[0]
$ContentItemLibraryBaseName = "$ContentItemLibraryBaseName-$Role"
Write-Host "Content Library Item Base Name: $ContentItemLibraryBaseName"


try {
    $ContentLibrary = Get-ContentLibrary -Name $ContentLibrary
    $ContentLibraryItems = @(Get-ContentLibraryItem -ContentLibrary $ContentLibrary -ItemType 'vm-template' -Name "$ContentItemLibraryBaseName*")
    Write-Host "Fount $($ContentLibraryItems.length) matching library items."

    Write-Host "Searching for current build:"
    $CurrentBuildContentLibraryItem = $ContentLibraryItems | Where-Object { $_.Name -eq $ContentLibraryItemName }
    if (!$CurrentBuildContentLibraryItem) {
        Write-Host "Current build not found... Aborting.."
        Disconnect-VIServer -Server $VIServer -Force -Confirm:$false
        exit 1
    }
    $CurrentBuildContentLibraryItem | Select-Object -Property Name, ContentLibrary, ItemType | Format-Table

    Write-Host "Searching for last build:"
    $LastBuildContentLibraryItem = $ContentLibraryItems | Where-Object { $_.Name -eq $ContentItemLibraryBaseName }
    if (!$LastBuildContentLibraryItem) {
        Write-Host "Last build not found... Asuming first build.."
    }
    else {
        Write-Host "Deprecating last build..."
        $LastBuildContentLibraryItem | Set-ContentLibraryItem -Name "$ContentItemLibraryBaseName-deprecated-at-$Date"
    }

    Write-Host "Enabled current build"
    $CurrentBuildContentLibraryItem | Set-ContentLibraryItem -Name "$ContentItemLibraryBaseName"

    Write-Host "Finished. Disconnecting"
    Disconnect-VIServer -Server $VIServer -Force -Confirm:$false

}
catch {
    Write-Error "Error communicating with content library $ContentLibrary $_"
    Disconnect-VIServer -Server $VIServer -Force -Confirm:$false
}




