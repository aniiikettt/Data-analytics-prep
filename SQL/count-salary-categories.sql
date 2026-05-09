SELECT
    "Low Salary" AS category,
    Count(income) AS accounts_count
FROM Accounts
WHERE income < 20000
UNION
SELECT
    "Average Salary" AS category,
    Count(income) AS accounts_count
FROM Accounts
WHERE income >= 20000 AND income <= 50000