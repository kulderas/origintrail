<#
 .DESCRIPTION 
    Gets node statistics for a given Blockchain, NodeId, Frequency, and Timeframe.

 .PARAMETER Blockchain
    The Blockchain to query - currently either "NeuroWeb" or "Gnosis".

 .PARAMETER NodeId
    The NodeId to query.

 .PARAMETER Frequency
    The frequency to query.  Use "hourly", "daily", or "monthly".

 .PARAMETER Timeframe
    The number of days, hours, etc. that should be queried/returned.

.NOTES
   There currently seems to be a bug with Timeframe.  The API seems to be returning one unit of timeframe less than requested.  For example,
   if you request 3 days, it will return 2.  Just add one to get what you are looking for.
#>

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

   # if([string]::IsNullOrEmpty($Blockchain)) {
   #    Write-Host "Please provide Blockchain..."
   # }

   # if([string]::IsNullOrEmpty($NodeId)) {
   #    Write-Host "Please provide NodeId..."
   # }

   # if([string]::IsNullOrEmpty($Frequency)) {
   #    Write-Host "Please provide Frequency..."
   # }

   # if([string]::IsNullOrEmpty($Timeframe)) {
   #    Write-Host "Please provide Timeframe..."
   # }

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