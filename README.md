# 📧 Automated Compliance Search Script

This repository contains a PowerShell script that automates **Microsoft Purview (Compliance Center) content searches** for multiple email addresses.  

The script solves the problem of **manually entering hundreds of email addresses** into the search query, which is time-consuming and prone to human error.  

---

## 🚀 Features
- Automates creation of a **Compliance Search** for a shared mailbox.  
- Reads **email addresses from a CSV file**.  
- Dynamically builds a **KQL query** (`from:` / `to:` filters).  
- Runs the search and waits until it completes.  
- Outputs search results metadata.  
- Can be reused for future **audit/compliance projects**.

---

## 🛠️ Prerequisites
1. **Roles/Permissions**
   - You need to be assigned one of the following roles in Microsoft 365:
     - **eDiscovery Manager**
     - **Compliance Administrator**
     - **Global Administrator**

2. **Modules**
   - [Exchange Online Management Module](https://learn.microsoft.com/powershell/exchange/exchange-online-powershell-v2)
   - [Security & Compliance PowerShell](https://learn.microsoft.com/microsoft-365/compliance/connect-to-scc-powershell)

   Install if not already present:
   ```powershell
   Install-Module ExchangeOnlineManagement -Scope CurrentUser
   ```

3. **CSV Input File**
   - A plain text/CSV file with one email address per line. Example:
     ```csv
     user1@domain.com
     user2@domain.com
     user3@domain.com
     ```

---

## ▶️ Usage
1. Update the script variables:
   ```powershell
   $list = Get-Content -Path "C:\Path\To\EmailList.csv"
   $searchName = "BulkEmailSearch"
   ```

2. Update mailbox location (shared mailbox or user mailbox):
   ```powershell
   -ExchangeLocation "SharedMailbox@domain.com"
   ```

3. Run the script in PowerShell:
   ```powershell
   .\ComplianceSearch.ps1
   ```

4. The script will:
   - Read email addresses from the CSV.  
   - Build a `ContentMatchQuery`.  
   - Create and start a compliance search.  
   - Wait until the search is completed.  
   - Display search summary info.  

---

## 📂 Repository Structure
```
/ComplianceSearch
│── ComplianceSearch.ps1   # Main PowerShell script
│── README.md              # Documentation
│── EmailList.csv          # Example input file (ignored in .gitignore)
```

---

## 📜 License
This project is licensed under the MIT License – see the [LICENSE](LICENSE) file for details.
