
# DELEGATOR STATS

curl.exe -X 'POST' `
  'https://api.othub.io/delegators/stats' `
  -H 'accept: */*' `
  -H 'x-api-key: b0XGtb9vG10nJ7gPJWs4ueS9CgQNlm' `
  -H 'Content-Type: application/json' `
  -d @"
{
  "network": "DKG Mainnet",
  "blockchain": "Gnosis Mainnet",
  "nodeId": "39",
  "frequency": "monthly",
  "timeframe": "7"
}
"@ | Out-File '.\delegator_stats.json'


# DELEGATOR ACTIVITY

curl.exe -X 'POST' `
  'https://api.othub.io/delegators/activity' `
  -H 'accept: */*' `
  -H 'x-api-key: b0XGtb9vG10nJ7gPJWs4ueS9CgQNlm' `
  -H 'Content-Type: application/json' `
  -d @"
{
  "network": "DKG Mainnet",
  "blockchain": "Gnosis Mainnet",
  "delegator": "0x067a421166C931DB7204bC3008e16983C1028Eb8",
  "nodeId": "",
  "txn_hash": ""
}
"@ | Out-File '.\delegator_activity.json'


# NODE INFO

curl.exe -X 'POST' `
  'https://api.othub.io/nodes/info' `
  -H 'accept: */*' `
  -H 'x-api-key: b0XGtb9vG10nJ7gPJWs4ueS9CgQNlm' `
  -H 'Content-Type: application/json' `
  -d @"
{
  "network": "DKG Mainnet",
  "blockchain": "Gnosis Mainnet",
  "nodeId": "33",
  "owner": ""
}
"@ | Out-File -FilePath '.\node_info1.json'

# NODE ACTIVITY

curl.exe -X 'POST' `
  'https://api.othub.io/nodes/activity' `
  -H 'accept: */*' `
  -H 'x-api-key: b0XGtb9vG10nJ7gPJWs4ueS9CgQNlm' `
  -H 'Content-Type: application/json' `
  -d @"
{
  "network": "DKG Mainnet",
  "blockchain": "Gnosis Mainnet",
  "nodeId": "39",
  "frequency": "24h",
  "ual": ""
}
"@ | Out-File -FilePath '.\node_activity.json'

# NODE STATS

curl.exe -X 'POST' `
  'https://api.othub.io/nodes/stats' `
  -H 'accept: */*' `
  -H 'x-api-key: b0XGtb9vG10nJ7gPJWs4ueS9CgQNlm' `
  -H 'Content-Type: application/json' `
  -d @"
{
  "network": "DKG Mainnet",
  "blockchain": "Gnosis Mainnet",
  "nodeId": "39",
  "frequency": "daily",
  "timeframe": "3",
  "grouped": "no"
}
"@ | Out-File '.\node_stats.json'

# PUBS NODE STATS

curl.exe -X 'POST' `
  'https://api.othub.io/pubs/stats' `
  -H 'accept: */*' `
  -H 'x-api-key: b0XGtb9vG10nJ7gPJWs4ueS9CgQNlm' `
  -H 'Content-Type: application/json' `
  -d @"
{
  "network": "DKG Mainnet",
  "blockchain": "Gnosis Mainnet",
  "nodeId": "39",
  "frequency": "monthly",
  "timeframe": "3"
}
"@ | Out-File '.\pubs_stats.json'

# PUBS ACTIVITY

curl.exe -X 'POST' `
  'https://api.othub.io/pubs/activity' `
  -H 'accept: */*' `
  -H 'x-api-key: b0XGtb9vG10nJ7gPJWs4ueS9CgQNlm' `
  -H 'Content-Type: application/json' `
  -d @"
{
  "network": "DKG Mainnet",
  "blockchain": "Gnosis Mainnet",
  "nodeId": "39",
  "signer": "",
  "timeframe": "24h",
  "ual": ""
}
"@ | Out-File '.\pub_activity.json'

# GEN KEY

curl.exe -X 'POST' `
  'https://api.othub.io/keys/create' `
  -H 'accept: */*' `
  -H 'Content-Type: application/json' `
  -d @"
{
  "rights_holder": ""
}
"@ | Out-File '.\key.json'

