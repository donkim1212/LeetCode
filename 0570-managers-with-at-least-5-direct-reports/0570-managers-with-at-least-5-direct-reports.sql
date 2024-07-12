WITH subquery AS (
    SELECT managerId AS id
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(managerId) >= 5
)

SELECT name
FROM Employee
WHERE id IN (SELECT id FROM subquery)