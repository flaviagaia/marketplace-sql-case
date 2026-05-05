DROP TABLE IF EXISTS delivery_orders;
DROP TABLE IF EXISTS business_info;

CREATE TABLE delivery_orders (
    delivery_id INTEGER PRIMARY KEY,
    order_place_time TEXT NOT NULL,
    business_line TEXT NOT NULL,
    business_id INTEGER NOT NULL,
    dasher_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL
);

CREATE TABLE business_info (
    business_id INTEGER PRIMARY KEY,
    business_name TEXT NOT NULL,
    business_size TEXT NOT NULL,
    phone_number TEXT NOT NULL
);
