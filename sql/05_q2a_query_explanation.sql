-- Objective of the query:
-- For each customer in 2021, count how many distinct deliveries they made in:
--   1. business_line = 'rx'
--   2. business_line = 'nv'
--
-- The output therefore creates a customer-level summary with two metrics:
--   rx = number of distinct rx deliveries in 2021
--   nv = number of distinct nv deliveries in 2021
--
-- This is useful as a first intermediate table for cross-vertical behavior analysis,
-- because it tells us whether a customer ordered from one vertical, the other, or both.

SELECT
    customer_id,
    COUNT(DISTINCT CASE WHEN business_line = 'rx' THEN delivery_id END) AS rx,
    COUNT(DISTINCT CASE WHEN business_line = 'nv' THEN delivery_id END) AS nv
FROM delivery_orders
WHERE order_place_time >= '2021-01-01'
  AND order_place_time < '2022-01-01'
GROUP BY customer_id;
