SELECT 
    machine_id,
    ROUND(AVG(diff), 3) AS processing_time
FROM (
    SELECT machine_id,
        process_id,
        MAX(CASE WHEN activity_type = 'end' THEN timestamp END)
        - MAX(CASE WHEN activity_type = 'start' THEN timestamp END) AS diff
    FROM Activity
    GROUP BY machine_id, process_id
) a
GROUP BY 1;