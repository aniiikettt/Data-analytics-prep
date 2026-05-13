(SELECT name AS results
FROM Users
INNER JOIN MovieRating USING(user_id)
GROUP BY user_id
ORDER BY COUNT(rating) DESC, name
LIMIT 1)

UNION ALL

(SELECT title AS results
FROM Movies
INNER JOIN MovieRating USING(movie_id)