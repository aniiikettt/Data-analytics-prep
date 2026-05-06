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