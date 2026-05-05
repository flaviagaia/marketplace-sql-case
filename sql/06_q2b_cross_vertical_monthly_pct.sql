WITH customer_monthly_orders AS (
    SELECT
        DATE(order_place_time, 'start of month') AS month,
        customer_id,
        COUNT(DISTINCT CASE WHEN business_line = 'rx' THEN delivery_id END) AS rx_orders,
        COUNT(DISTINCT CASE WHEN business_line = 'nv' THEN delivery_id END) AS nv_orders
    FROM delivery_orders
    WHERE order_place_time >= '2021-01-01'
      AND order_place_time < '2022-01-01'
    GROUP BY
        DATE(order_place_time, 'start of month'),
        customer_id
),
customer_monthly_labels AS (
    SELECT
        month,
        customer_id,
        CASE
            WHEN rx_orders > 0 AND nv_orders > 0 THEN 'both'
            WHEN rx_orders > 0 THEN 'rx'
            WHEN nv_orders > 0 THEN 'nv'
        END AS customer_type
    FROM customer_monthly_orders
    WHERE rx_orders > 0 OR nv_orders > 0
)
SELECT
    month,
    ROUND(
        1.0 * COUNT(DISTINCT CASE WHEN customer_type = 'both' THEN customer_id END)
        / COUNT(DISTINCT customer_id),
        2
    ) AS pct
FROM customer_monthly_labels
GROUP BY month
ORDER BY month;
