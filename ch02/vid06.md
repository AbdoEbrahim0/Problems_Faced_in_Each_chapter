# 🧩 Problem: UPDATE with JOIN Works but Changes Not Reflected in Table View

## 📌 Context
While practicing DML queries with `JOIN`, I noticed that after running an `UPDATE` statement, the changes appeared correctly in my `SELECT` queries—but not when I manually opened the table in SQL Server Management Studio (SSMS).

## ⚠️ Issue
- `UPDATE` query executes successfully.
- `SELECT` confirms the data is updated.
- But when opening the table directly in SSMS (via right-click → "Edit Top 200 Rows"), the changes seem missing or unchanged.

## ✅ Solution
**Close the table window and reopen it.**

> SSMS sometimes caches the table view. To reflect the latest changes:
> - Close the current table tab.
> - Reopen it using "Edit Top 200 Rows" or run a fresh `SELECT` query.

## 🧠 Notes
- This is a UI refresh issue, not a SQL problem.
- Always verify updates using direct `SELECT` statements.
- If working with transactions, ensure they are committed.

---

📁 Chapter: CH02  
🎥 Related Video: VID06 – Use Joins with DML Queries  
🔗 [Course Link](https://maharatech.gov.eg/mod/hvp/view.php?id=16977&forceview=1)  
