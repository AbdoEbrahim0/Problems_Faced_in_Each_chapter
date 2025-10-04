# 🧩 Issue: Queries Not Working After Connecting to SQL Server

## 🔍 Problem
After starting a connection in SQL Server, I noticed that **no queries were executing properly**. Even simple `SELECT` statements failed without any error message.

---

## ✅ Solution

The issue was that **no database was selected**. SQL Server requires you to activate a specific database before running queries.

To fix this, run:

```sql
USE [YourDatabaseName];
