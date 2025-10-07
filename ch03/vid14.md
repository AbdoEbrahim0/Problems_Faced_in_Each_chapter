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

## 🧵 Advanced String Manipulation in SQL Server — `STRING_SPLIT()` and `STRING_AGG()`

These two functions are powerful tools introduced in **SQL Server 2016+** for working with string arrays and aggregation.

---

### 🔹 `STRING_SPLIT()` — Split String into Rows

| SQL Statement                                               | Output Rows         | Description                                                                 |
|-------------------------------------------------------------|----------------------|-----------------------------------------------------------------------------|
| `SELECT value FROM STRING_SPLIT('SQL,Python,C++', ',');`    | `SQL`<br>`Python`<br>`C++` | Splits a delimited string into multiple rows                             |
| `SELECT value FROM STRING_SPLIT('Mahara-Tech-2025', '-');`  | `Mahara`<br>`Tech`<br>`2025` | Useful for parsing structured strings like tags or codes              |

> ⚠️ **Note:** `STRING_SPLIT()` returns a single column named `value`. It does not guarantee order unless used with `ORDER BY`.

---

### 🔹 `STRING_AGG()` — Aggregate Rows into a Single String

| SQL Statement                                                                 | Output                      | Description                                                                 |
|-------------------------------------------------------------------------------|------------------------------|-----------------------------------------------------------------------------|
| `SELECT STRING_AGG(language, ', ') FROM (VALUES ('SQL'), ('Python'), ('C++')) AS t(language);` | `SQL, Python, C++`          | Combines multiple row values into one string with a separator               |
| `SELECT STRING_AGG(name, ', ') WITHIN GROUP (ORDER BY name) FROM Students;`  | `Ahmed, Fatma, Youssef`     | Aggregates student names in alphabetical order                             |

> 🧠 `STRING_AGG()` is especially useful for generating comma-separated lists, tags, or summaries from grouped data.

---

## ⚠️ Compatibility Disclaimer

Both `STRING_SPLIT()` and `STRING_AGG()` require **SQL Server 2016 or later**. If you restore a database created in an older version, these functions may not work.

### 🛠️ How to Fix Compatibility Issues

1. **Ensure compatibility level is at least 140** (SQL Server 2017 or later recommended).
2. **Steps to change compatibility level**:
   - Right-click your database in **SQL Server Management Studio (SSMS)**.
   - Go to **Properties** → **Options**.
   - Change **Compatibility Level** to **SQL Server 2016 (140)** or higher.
   - Click **OK** to apply.

Once updated, both functions will be available and fully functional.

---

#### Example on some output

<img width="246" height="277" alt="image" src="https://github.com/user-attachments/assets/a9b61c9f-f3bf-4e29-b5fa-64a394f9c01a" />
