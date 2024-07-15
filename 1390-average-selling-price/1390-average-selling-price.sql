WITH all_products AS (
    SELECT DISTINCT product_id
    FROM Prices
)

SELECT ap.product_id,
    COALESCE(ROUND(SUM(us.units * p.price) / SUM(us.units), 2), 0) AS average_price
FROM all_products ap
LEFT JOIN UnitsSold us
    ON ap.product_id = us.product_id
LEFT JOIN Prices p
    ON ap.product_id = p.product_id
    AND us.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY 1