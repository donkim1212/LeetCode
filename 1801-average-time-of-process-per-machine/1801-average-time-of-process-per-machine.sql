SELECT machine_id,
    ROUND(SUM(CASE WHEN activity_type LIKE 'end' THEN timestamp ELSE -timestamp END) / (COUNT(1) / 2), 3) AS processing_time
FROM Activity
GROUP BY machine_id