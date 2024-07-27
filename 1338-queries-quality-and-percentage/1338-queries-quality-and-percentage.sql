WITH total_counts AS (
    SELECT query_name,
           COUNT(*) AS total_count
    FROM Queries
    GROUP BY query_name
),
poor_counts AS (
    SELECT query_name,
           COUNT(*) AS poor_count
    FROM Queries
    WHERE rating < 3
    GROUP BY query_name
),
query_quality AS (
    SELECT query_name,
           ROUND(AVG(rating / position), 2) AS quality
    FROM Queries
    GROUP BY query_name
)

SELECT q.query_name,
       q.quality,
       COALESCE(ROUND(p.poor_count * 100.0 / t.total_count, 2), 0) AS poor_query_percentage
FROM query_quality AS q
JOIN total_counts AS t ON q.query_name = t.query_name
LEFT JOIN poor_counts AS p ON q.query_name = p.query_name;