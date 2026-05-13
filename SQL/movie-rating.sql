(SELECT name AS results
FROM Users
INNER JOIN MovieRating USING(user_id)