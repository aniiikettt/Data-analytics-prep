-- Problem: Number of unique subjects taught by each teacher
-- Platform: LeetCode
-- Approach: Using GROUP BY and COUNT DISTINCT

SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;