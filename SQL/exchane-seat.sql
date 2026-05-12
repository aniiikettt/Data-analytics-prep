SELECT
    CASE
        WHEN 
            id = (SELECT MAX(id) FROM Seat) AND MOD(id , 2) = 1
            THEN id 
        WHEN 