WITH best_scores AS (
    SELECT 
        event_id,
        participant_name,
        MAX(score) AS best_score
    FROM scoretable
    GROUP BY event_id, participant_name
    ),
ranked_scores AS (
    SELECT 
        event_id,
        participant_name,
        best_score,
        DENSE_RANK() OVER (
            PARTITION BY event_id
            ORDER BY best_score DESC
        ) AS rnk
    FROM best_scores
)
SELECT
    event_id,
    GROUP_CONCAT(CASE WHEN rnk = 1 THEN participant_name END 
        ORDER BY participant_name SEPARATOR ',') AS first,
    GROUP_CONCAT(CASE WHEN rnk = 2 THEN participant_name END 
        ORDER BY participant_name SEPARATOR ',') AS second,
    GROUP_CONCAT(CASE WHEN rnk = 3 THEN participant_name END 
        ORDER BY participant_name SEPARATOR ',') AS third
FROM ranked_scores
WHERE rnk <= 3
GROUP BY event_id
ORDER BY event_id;
 