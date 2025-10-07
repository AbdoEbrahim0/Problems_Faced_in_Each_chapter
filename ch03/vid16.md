# 🔀 Conditional Logic in SQL Server — CASE, IIF, and UPDATE

SQL Server provides powerful tools for applying conditional logic directly in queries. The most common are `CASE` and `IIF`, which can be used in `SELECT`, `UPDATE`, and other statements.

---

## 🧩 `CASE` Statement — Multi-Condition Logic

| SQL Statement                                                                 | Output         | Description                                                  |
|-------------------------------------------------------------------------------|----------------|--------------------------------------------------------------|
| `SELECT ins_name, CASE WHEN salary > 3000 THEN 'high salary' WHEN salary = 3000 THEN 'low' ELSE 'no data' END AS crt FROM Instructor;` | `high salary` / `low` / `no data` | Evaluates multiple conditions and returns matching result     |

### ✅ Use Case
- Best for complex logic with multiple `WHEN` conditions.
- Can be used in `SELECT`, `UPDATE`, `ORDER BY`, etc.

---

## ⚡ `IIF()` Function — Simple Conditional Logic

| SQL Statement                                                                 | Output         | Description                                                  |
|-------------------------------------------------------------------------------|----------------|--------------------------------------------------------------|
| `SELECT ins_name, IIF(salary >= 3000, 'high', 'low') FROM Instructor;`        | `high` / `low` | Returns one of two values based on a Boolean condition       |

### ✅ Use Case
- Shorthand for simple `IF...ELSE` logic.
- Introduced in SQL Server 2012.

---

## 🔧 `UPDATE` with `CASE` — Conditional Data Modification

| SQL Statement                                                                 | Description                                                  |
|-------------------------------------------------------------------------------|--------------------------------------------------------------|
| `UPDATE Instructor SET salary = CASE WHEN salary >= 3000 THEN salary * 1.20 ELSE salary * 1.10 END;` | Increases salary by 20% if ≥ 3000, otherwise by 10%          |

---

## 🔧 `UPDATE` with `IIF()` — Simpler Conditional Update

| SQL Statement                                                                 | Description                                                  |
|-------------------------------------------------------------------------------|--------------------------------------------------------------|
| `UPDATE Instructor SET salary = IIF(salary >= 3000, salary * 1.20, salary * 1.10);` | Same logic as above using IIF for cleaner syntax             |

---

## 🛠️ Summary

| Feature     | Best For                        | Supports Multiple Conditions | SQL Server Version |
|-------------|----------------------------------|-------------------------------|---------------------|
| `CASE`      | Complex logic, multiple branches | ✅ Yes                        | All versions        |
| `IIF()`     | Simple true/false logic          | ❌ No                         | 2012+               |

---

Let me know if you'd like to add Arabic translations, quiz questions, or visual diagrams to make this section even more engaging for your learners. I can also help you link this to your GitHub documentation or course notes.
