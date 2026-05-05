SELECT
    b.business_name,
    COUNT(d.delivery_id) AS order_count
FROM business_info AS b
LEFT JOIN delivery_orders AS d
    ON b.business_id = d.business_id
    AND d.business_line = 'rx'
    AND d.order_place_time >= '2021-10-01'
    AND d.order_place_time < '2022-01-01'
GROUP BY b.business_name
ORDER BY order_count DESC, b.business_name;
