# Install SDK

$webPIServiceFabricPreviewFeedURL = 'http://aka.ms/servicefabricprivatepreviewfeed'

& 'C:\Program Files\Microsoft\Web Platform Installer\WebpiCmd.exe' /Install /XML:$webPIServiceFabricPreviewFeedURL /Products:'MicrosoftAzure-ServiceFabric' /AcceptEULA

# Add link to docs to desktop

$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\Service Fabric Documentation.lnk")
$Shortcut.TargetPath = "http://aka.ms/servicefabricdocs"
$Shortcut.IconLocation = "C:\Windows\System32\url.dll"

$Shortcut.Save()

# Add link to samples to desktop

$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\Service Fabric Samples.lnk")
$Shortcut.TargetPath = "http://aka.ms/servicefabricsamples"
$Shortcut.IconLocation = "C:\Windows\System32\url.dll"

$Shortcut.Save()

# Add shortcut to Service Fabric Explorer to desktop

$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\Service Fabric Explorer.lnk")
$Shortcut.TargetPath = 'C:\Program Files\Microsoft SDKs\Service Fabric\Tools\ServiceFabricExplorer\ServiceFabricExplorer.exe'
$Shortcut.IconLocation = 'C:\Program Files\Microsoft SDKs\Service Fabric\Tools\ServiceFabricExplorer\ServiceFabricExplorer.exe'

$Shortcut.Save()

# Set Execution Policy

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

# Set up local cluster

& 'C:\Program Files\Microsoft SDKs\Service Fabric\ClusterSetup\DevClusterSetup.ps1'