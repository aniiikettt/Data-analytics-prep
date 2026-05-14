SELECT visited_on ,
        (
             SELECT SUM(amount)
            FROM Customer
            WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY)
            AND c.visited_on
            ) AS amount ,
            ROUND((