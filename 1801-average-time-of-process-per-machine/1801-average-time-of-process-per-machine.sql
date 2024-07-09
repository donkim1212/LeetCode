SELECT 
    machine_id,
    ROUND(SUM(process_time) / (COUNT(1) / 2), 3) AS processing_time
FROM (
    SELECT 
        machine_id,
        CASE 
            WHEN activity_type LIKE 'end' THEN timestamp 
            ELSE -timestamp 
        END AS process_time
    FROM Activity
) AS processed_data
GROUP BY machine_id;