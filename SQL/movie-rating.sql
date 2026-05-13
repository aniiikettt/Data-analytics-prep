(SELECT name AS results
FROM Users
INNER JOIN MovieRating USING(user_id)
GROUP BY user_id
ORDER BY COUNT(rating) DESC, name
LIMIT 1)