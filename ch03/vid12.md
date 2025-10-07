## 🚫 SQL Server NULL-Handling Functions — Statement and Output Table

| SQL Statement                                                  | Output         | Description                                                                 |
|----------------------------------------------------------------|----------------|-----------------------------------------------------------------------------|
| `SELECT ISNULL(NULL, 'Default');`                              | `'Default'`    | Replaces NULL with a specified value                                        |
| `SELECT ISNULL('Mahara-Tech', 'Default');`                     | `'Mahara-Tech'`| Returns original value if not NULL                                          |
| `SELECT COALESCE(NULL, NULL, NULL, 'No Data');`                | `'No Data'`    | Returns first non-NULL value from the list                                  |
| `SELECT COALESCE('Primary', 'Fallback', 'Final');`             | `'Primary'`    | Returns first non-NULL value (even if it's the first one)                   |
| `SELECT NULLIF(5, 5);`                                         | `NULL`         | Returns NULL if both values are equal                                       |
| `SELECT NULLIF(5, 10);`                                        | `5`            | Returns first value if values are not equal                                 |
