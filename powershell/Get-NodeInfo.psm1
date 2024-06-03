using namespace System.Management.Automation.Host

function Get-NodeStats {
    # [CmdletBinding()]
    # param(
    #     [Parameter(Mandatory)]
    #     [ValidateNotNullOrEmpty()]
    #     [string]$Title,

    #     [Parameter(Mandatory)]
    #     [ValidateNotNullOrEmpty()]
    #     [string]$Question
    # )
    
    $red = [ChoiceDescription]::new('&Stats', 'Get node stats')
    $blue = [ChoiceDescription]::new('&Blue', 'Favorite color: Blue')
    $yellow = [ChoiceDescription]::new('&Yellow', 'Favorite color: Yellow')

    $options = [ChoiceDescription[]]($red, $blue, $yellow)

    $result = $host.ui.PromptForChoice("Menu", "Select one of the follwing", $options, 0)

    switch ($result) {
        0 { Get-NodeStats }
        1 { 'Your favorite color is Blue' }
        2 { 'Your favorite color is Yellow' }
    }

}

   
function Get-NodeStats {
    param
    (
       [Parameter(Mandatory)]
       [string]
       $Blockchain,
 
       [Parameter(Mandatory)]
       [string]
       $NodeId,
 
       [Parameter(Mandatory)]
       [string]
       $Frequency,
 
       [Parameter(Mandatory)]
       [string]
       $Timeframe
 
       # [Parameter(Mandatory)]
       # [boolean]
       # $Grouped
    )
 
 # need to check if params are empty   
 
    $stats = curl.exe -X 'POST' `
       'https://api.othub.io/nodes/stats' `
       -H 'accept: */*' `
       -H 'x-api-key: b0XGtb9vG10nJ7gPJWs4ueS9CgQNlm' `
       -H 'Content-Type: application/json' `
       -d @"
{
"network": "DKG Mainnet",
"blockchain": "$Blockchain Mainnet",
"nodeId": "$NodeId",
"frequency": "$Frequency",
"timeframe": "$Timeframe",
"grouped": "no"
}
"@ | ConvertFrom-Json
 
    # if($Timeframe -eq "1" -and ($Frequency -eq "daily" -or $Frequency -eq "monthly"))
    if($Timeframe -eq "1")
    {
       $count = ($stats.result.data).Count
       $stats.result.data[$count-1]
    } else {
       $stats.result.data  # Format-Table
    }
 }

