SELECT
    "Low Salary" AS category,
    Count(income) AS accounts_count
FROM Accounts
WHERE income < 20000