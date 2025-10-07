# 📅 SQL Server Date and Time Functions

SQL Server provides a variety of built-in functions to handle date and time values. These functions are essential for querying, formatting, and manipulating temporal data.

---

## 🕒 1. System Date and Time Retrieval

| Function               | Description                                      | Example                          | Output Example                  |
|------------------------|--------------------------------------------------|----------------------------------|----------------------------------|
| `GETDATE()`            | Returns current system date and time             | `SELECT GETDATE();`              | `2025-10-07 13:35:22.123`        |
| `GETUTCDATE()`         | Returns current UTC date and time                | `SELECT GETUTCDATE();`           | `2025-10-07 11:35:22.123`        |
| `SYSDATETIME()`        | Returns current date/time with high precision    | `SELECT SYSDATETIME();`          | `2025-10-07 13:35:22.1234567`    |
| `SYSDATETIMEOFFSET()`  | Returns current date/time with time zone offset  | `SELECT SYSDATETIMEOFFSET();`    | `2025-10-07 13:35:22.1234567 +02:00` |
| `SYSUTCDATETIME()`     | Returns current UTC date/time with high precision| `SELECT SYSUTCDATETIME();`       | `2025-10-07 11:35:22.1234567`    |

---

## 📆 2. Extracting Date Parts

| Function        | Description                                | Example                                | Output     |
|-----------------|--------------------------------------------|----------------------------------------|------------|
| `YEAR()`        | Extracts year from a date                  | `SELECT YEAR(GETDATE());`              | `2025`     |
| `MONTH()`       | Extracts month from a date                 | `SELECT MONTH(GETDATE());`             | `10`       |
| `DAY()`         | Extracts day from a date                   | `SELECT DAY(GETDATE());`               | `7`        |
| `DATEPART()`    | Returns integer for specified date part    | `SELECT DATEPART(hour, GETDATE());`    | `13`       |
| `DATENAME()`    | Returns string for specified date part     | `SELECT DATENAME(month, GETDATE());`   | `October`  |

---

## 🧱 3. Constructing Dates and Times

| Function               | Description                                      | Example Statement                                  | Output                  |
|------------------------|--------------------------------------------------|----------------------------------------------------|--------------------------|
| `DATEFROMPARTS()`      | Builds a date from year, month, and day          | `SELECT DATEFROMPARTS(2025, 10, 7);`               | `2025-10-07`             |
| `DATETIME2FROMPARTS()` | Builds datetime2 from components                 | `SELECT DATETIME2FROMPARTS(2025,10,7,13,35,0,0,7);`| `2025-10-07 13:35:00.0000000` |
| `TIMEFROMPARTS()`      | Builds time from hour, minute, second            | `SELECT TIMEFROMPARTS(13, 35, 0, 0, 7);`           | `13:35:00.0000000`       |

---

## 🔁 4. Date Arithmetic and Comparison

| Function     | Description                              | Example Statement                                  | Output     |
|--------------|------------------------------------------|----------------------------------------------------|------------|
| `DATEDIFF()` | Returns difference between two dates     | `SELECT DATEDIFF(day, '2025-10-01', '2025-10-07');`| `6`        |
| `DATEADD()`  | Adds interval to a date                  | `SELECT DATEADD(day, 5, '2025-10-07');`            | `2025-10-12`|
| `EOMONTH()`  | Returns last day of the month            | `SELECT EOMONTH('2025-10-07');`                    | `2025-10-31`|

---

## ✅ 5. Date Validation

| Function   | Description                        | Example Statement               | Output |
|------------|------------------------------------|----------------------------------|--------|
| `ISDATE()` | Checks if input is a valid date    | `SELECT ISDATE('2025-10-07');`   | `1`    |
|            |                                    | `SELECT ISDATE('NotADate');`     | `0`    |
