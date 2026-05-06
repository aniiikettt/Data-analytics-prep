WITH best_scores AS (
    SELECT 
        event_id,
        participant_name,
        MAX(score) AS best_score
    FROM scoretable
    GROUP BY event_id, participant_name
 