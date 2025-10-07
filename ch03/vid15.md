# 🧠 Logical and 🧮 Mathematical Functions in SQL Server

This guide covers essential logical and mathematical functions in SQL Server with examples and expected outputs. These functions are useful for data validation, conditional logic, and numeric computations.

---

## 🧠 Logical Functions — Statement and Output Table

| SQL Statement                                  | Output     | Description                                                                 |
|------------------------------------------------|------------|-----------------------------------------------------------------------------|
| `SELECT ISDATE('2025-10-07');`                 | `1`        | Returns 1 if the input is a valid date                                     |
| `SELECT ISDATE('NotADate');`                   | `0`        | Returns 0 if the input is not a valid date                                 |
| `SELECT ISNUMERIC('123');`                     | `1`        | Returns 1 if the input is a valid numeric value                            |
| `SELECT ISNUMERIC('abc');`                     | `0`        | Returns 0 if the input is not numeric                                      |
| `SELECT CHOOSE(2, 'SQL', 'Python', 'C++');`    | `Python`   | Returns the item at the specified index (1-based)                          |
| `SELECT IIF(5 > 3, 'Yes', 'No');`              | `Yes`      | Returns one of two values based on a condition                             |
| `SELECT NULLIF(100, 100);`                     | `NULL`     | Returns NULL if both expressions are equal                                 |
| `SELECT NULLIF(100, 200);`                     | `100`      | Returns first value if expressions are not equal                           |

---

## 🧮 Mathematical Functions — Statement and Output Table

| SQL Statement                          | Output     | Description                                                                 |
|----------------------------------------|------------|-----------------------------------------------------------------------------|
| `SELECT ABS(-10);`                     | `10`       | Returns the absolute value                                                  |
| `SELECT FLOOR(10.75);`                 | `10`       | Rounds down to the nearest whole number                                     |
| `SELECT CEILING(10.25);`               | `11`       | Rounds up to the nearest whole number                                       |
| `SELECT ROUND(123.4567, 2);`           | `123.46`   | Rounds to specified decimal places                                          |
| `SELECT SQRT(25);`                     | `5.0`      | Returns the square root                                                     |
| `SELECT SQUARE(5);`                    | `25`       | Returns the square of the number                                            |
| `SELECT POWER(2, 3);`                  | `8`        | Raises 2 to the power of 3                                                  |
| `SELECT PI();`                         | `3.14159`  | Returns the value of π                                                      |
| `SELECT SIGN(-100);`                   | `-1`       | Returns -1 for negative, 0 for zero, 1 for positive                         |
| `SELECT EXP(1);`                       | `2.71828`  | Returns Euler’s number raised to the power of input                        |
| `SELECT LOG(10);`                      | `2.30258`  | Returns natural logarithm (base e)                                          |
| `SELECT LOG10(100);`                   | `2`        | Returns base-10 logarithm                                                   |
| `SELECT RAND();`                       | `0.XXXXXX` | Returns a random float between 0 and 1                                     |
| `SELECT DEGREES(PI());`               | `180`      | Converts radians to degrees                                                 |
| `SELECT RADIANS(180);`                | `3.14159`  | Converts degrees to radians                                                 |

---

