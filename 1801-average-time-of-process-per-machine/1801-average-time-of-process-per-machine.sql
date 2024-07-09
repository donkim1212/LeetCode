SELECT machine_id,
    ROUND(AVG(processing_time), 3) AS processing_time
FROM (
    SELECT machine_id,
        process_id,
        MAX(CASE WHEN activity_type LIKE 'end' THEN timestamp END) -
        MAX(CASE WHEN activity_type LIKE 'start' THEN timestamp END)
        AS processing_time
    FROM Activity
    GROUP BY machine_id, process_id
) a
GROUP BY machine_id