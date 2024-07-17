WITH total_count AS (
    SELECT COUNT(*) AS count
    FROM Users
)

SELECT contest_id,
    ROUND(COUNT(DISTINCT user_id) / (SELECT count FROM total_count LIMIT 1) * 100, 2) AS percentage
FROM Register
GROUP BY 1
ORDER BY 2 DESC, 1;