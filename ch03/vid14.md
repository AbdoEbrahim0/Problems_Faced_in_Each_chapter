## 🧵 String Manipulation in SQL Server — Statement and Output Table

| SQL Statement                                               | Output               | Description                                                                 |
|-------------------------------------------------------------|----------------------|-----------------------------------------------------------------------------|
| `SELECT CONCAT('Hello', ' ', 'World');`                     | `Hello World`        | Combines multiple strings into one                                          |
| `SELECT CONCAT_WS('-', '2025', '10', '07');`                | `2025-10-07`         | Combines strings with a separator                                           |
| `SELECT QUOTENAME('Instructor');`                           | `[Instructor]`       | Adds delimiters to make a valid SQL identifier                              |
| `SELECT UPPER('abdo');`                                     | `ABDO`               | Converts string to uppercase                                                |
| `SELECT LOWER('ABDO');`                                     | `abdo`               | Converts string to lowercase                                                |
| `SELECT LEN('Mahara-Tech');`                                | `11`                 | Returns length of string (excluding trailing spaces)                        |
| `SELECT SUBSTRING('Mahara-Tech', 1, 6);`                    | `Mahara`             | Extracts substring from position 1 with length 6                            |
| `SELECT LEFT('Mahara-Tech', 6);`                            | `Mahara`             | Returns first 6 characters                                                  |
| `SELECT RIGHT('Mahara-Tech', 4);`                           | `Tech`               | Returns last 4 characters                                                   |
| `SELECT CHARINDEX('Tech', 'Mahara-Tech');`                  | `8`                  | Finds position of substring                                                 |
| `SELECT PATINDEX('%Tech%', 'Mahara-Tech');`                 | `8`                  | Finds pattern position using wildcards                                      |
| `SELECT REPLACE('Mahara-Tech', 'Tech', 'SQL');`             | `Mahara-SQL`         | Replaces substring with another                                             |
| `SELECT STUFF('Mahara-Tech', 8, 4, 'SQL');`                 | `Mahara-SQL`         | Deletes part of string and inserts another                                 |
| `SELECT TRIM('   Mahara-Tech   ');`                         | `Mahara-Tech`        | Removes leading and trailing spaces                                         |
| `SELECT LTRIM('   Mahara-Tech');`                           | `Mahara-Tech`        | Removes leading spaces                                                      |
| `SELECT RTRIM('Mahara-Tech   ');`                           | `Mahara-Tech`        | Removes trailing spaces                                                     |
| `SELECT REVERSE('Mahara');`                                 | `arahaM`             | Reverses the string                                                         |
| `SELECT REPLICATE('SQL-', 3);`                              | `SQL-SQL-SQL-`       | Repeats the string a specified number of times                              |
| `SELECT value FROM STRING_SPLIT('SQL,Python,C++', ',');`    | `SQL`<br>`Python`<br>`C++` | Splits string into rows based on delimiter (table-valued function)   |

---

## ⚠️ Disclaimer: Using `STRING_SPLIT()` Function

The `STRING_SPLIT()` function is available **starting from SQL Server 2016** (compatibility level 130+). If you restore a database created in an older version, this function may not work.

### 🛠️ How to Fix Compatibility Issues

To enable `STRING_SPLIT()` in older databases:

1. **Ensure compatibility level is at least 140** (SQL Server 2017 or later recommended).
2. **Steps to change compatibility level**:
   - Right-click on your database in SQL Server Management Studio (SSMS).
   - Go to **Properties** → **Options**.
   - Change **Compatibility Level** to **SQL Server 2016 (140)** or higher.
   - Click **OK** to apply.

Once updated, `STRING_SPLIT()` will be available and function correctly.

---

