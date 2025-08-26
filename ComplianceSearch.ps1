# PowerShell Script for Automated Compliance Search with Multiple Email Addresses
# This script automates Microsoft Purview (Compliance Center) content searches for specific sender/receiver email addresses.

# Load email addresses from CSV file
$list = Get-Content -Path "C:\Path\To\EmailList.csv"

# Create KQL query parts for "from" and "to"
$from_str = $list | ForEach-Object {"from:$_"}
$to_str = $list | ForEach-Object {"to:$_"}

# Join them into a single query string
$list_str_from = $from_str -join " OR "
$list_str_to = $to_str -join " OR "

# Define search name (change as needed)
$searchName = "BulkEmailSearch"

# Create compliance search (modify ExchangeLocation for your mailbox)
New-ComplianceSearch -Name $searchName -ExchangeLocation "SharedMailbox@domain.com" -ContentMatchQuery $list_str_from

# Start compliance search
Start-ComplianceSearch -Identity $searchName

# Wait until search is completed
$q = Get-ComplianceSearch -Identity $searchName
While ($q.Status -ne 'Completed') {
    Start-Sleep -Seconds 5
    $q = Get-ComplianceSearch -Identity $searchName
}

# Output search details
$q
