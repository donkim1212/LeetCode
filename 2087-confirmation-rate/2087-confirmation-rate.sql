WITH conf_counts AS (
    SELECT user_id,
        COUNT(1) AS count,
        SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END) AS confirmed
    FROM Confirmations
    GROUP BY user_id
)

SELECT s.user_id,
    COALESCE(FORMAT(cc.confirmed / cc.count, 2) + 0, 0) AS confirmation_rate
FROM Signups s
LEFT JOIN conf_counts cc
    ON s.user_id = cc.user_id
