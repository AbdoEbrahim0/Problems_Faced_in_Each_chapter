# 🛠️ Restoring ITI Database from Backup (.bak)

## 🔍 Problem
When trying to restore the `ITI.bak` file, I got this error:
Msg 5133: Directory lookup for the file "C:\DB\ITI.mdf" failed..


This happened because the folder `C:\DB\` does not exist on my system. SQL Server couldn’t find the path to place the database files.

---

## ✅ Solution

### Step 1: Understand the Default File Path
You don’t need `.mdf` or `.ldf` files separately—the `.bak` file contains everything.

To find where SQL Server stores its data files by default, run:
```sql
SELECT SERVERPROPERTY('InstanceDefaultDataPath');

RESTORE DATABASE ITI
FROM DISK = 'D:\YourBackupPath\ITI.bak'
WITH 
    MOVE 'ITI' TO 'C:\YourDataPath\ITI.mdf',
    MOVE 'ITI_log' TO 'C:\YourDataPath\ITI_log.ldf',
    REPLACE,
    STATS = 10;


