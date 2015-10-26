switch-azuremode -name AzureResourceManager
select-AzureSubscription -subscriptionid 85182b66-6daa-40c6-bfa8-42dcc6d6845e

$count = 1
$templateFile = "C:\Users\kenazk\Desktop\GitHub\kenaztemplates\puppetenterprise\azuredeploy.json"
$paramsFile = "C:\Users\kenazk\Desktop\GitHub\kenaztemplates\puppetenterprise\azuredeploy.parameters.json"
$params = Get-content $paramsFile | convertfrom-json
$rgprefix = "puppet"

# Generate parameter object
$hash = @{};
foreach($param in $params.psobject.Properties)
{
    $hash.Add($param.Name, $param.Value.Value);
}

#Create new Resource Groups and Deployments for each run
for($i = 0; $i -lt $count; $i++)
{
    # Create new Resource Group
    $d = get-date
    $rgname = $rgprefix + '-'+ $d.Year + $d.Month + $d.Day + '-' + $d.Hour + $d.Minute + $d.Second
    New-AzureResourceGroup -Name $rgname -Location "westus" -Verbose 
    
    # Construct parameter set
    $dsuffix = "" + $d.hour + $d.minute + $d.Second
    $hash.dnsNameForPublicIP = "test" + $dsuffix

    # Run as asynchronous job
    $jobName = "dep-" + $i;
    $sb = {
        param($rgname, $templateFile, $hash)
        function createDeployment($rgname, $templateFile, $hash)
        {
            $dep = $rgname + "-dep"; 
            New-AzureResourceGroupDeployment -ResourceGroupName $rgname -Name $dep -TemplateFile $templateFile -TemplateParameterObject $hash -Verbose 
        }
        createDeployment $rgname $templateFile $hash
    }
    $job = start-job -Name $jobName -ScriptBlock $sb -ArgumentList $rgname, $templateFile, $hash
}


