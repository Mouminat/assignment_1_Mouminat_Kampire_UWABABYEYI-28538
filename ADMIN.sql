INSERT ALL
    INTO customers VALUES (1, 'Alice Mukamana', 'alice@gmail.com', 'Kigali')
    INTO customers VALUES (2, 'Brian Niyonzima', 'brian@gmail.com', 'Huye')
    INTO customers VALUES (3, 'Claudine Uwase', 'claudine@gmail.com', 'Musanze')
    INTO customers VALUES (4, 'David Habimana', 'david@gmail.com', 'Kigali')
    INTO customers VALUES (5, 'Eric Tuyisenge', 'eric@gmail.com', 'Rubavu')
    INTO customers VALUES (6, 'Grace Ingabire', 'grace@gmail.com', 'Kigali')
SELECT 1 FROM dual;

COMMIT;

SELECT COUNT(*) AS customer_count FROM customers;

SELECT COUNT(*) FROM customers;

SELECT 'CUSTOMERS' AS table_name, COUNT(*) AS row_count FROM customers
UNION ALL
SELECT 'PRODUCTS', COUNT(*) FROM products
UNION ALL
SELECT 'ORDERS', COUNT(*) FROM orders
UNION ALL
SELECT 'ORDER_ITEMS', COUNT(*) FROM order_items;

SELECT
    o.order_id,
    c.customer_name,
    c.city,
    o.order_date
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
ORDER BY o.order_date;

SELECT
    oi.order_item_id,
    oi.order_id,
    p.product_name,
    p.category,
    p.price,
    oi.quantity
FROM order_items oi
INNER JOIN products p
    ON oi.product_id = p.product_id
ORDER BY oi.order_item_id;

SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.order_date
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
ORDER BY c.customer_id, o.order_date;

WITH customer_totals AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(oi.quantity * p.price) AS total_spend
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    JOIN products p
        ON oi.product_id = p.product_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT
    customer_id,
    customer_name,
    total_spend
FROM customer_totals
WHERE total_spend > (
    SELECT AVG(total_spend)
    FROM customer_totals
)
ORDER BY total_spend DESC;

WITH customer_totals AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(oi.quantity * p.price) AS total_spend
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    JOIN products p
        ON oi.product_id = p.product_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT
    customer_id,
    customer_name,
    total_spend,
    RANK() OVER (ORDER BY total_spend DESC) AS spending_rank
FROM customer_totals
ORDER BY spending_rank;

SELECT
    o.order_id,
    c.customer_name,
    o.order_date,
    ROW_NUMBER() OVER (
        PARTITION BY o.customer_id
        ORDER BY o.order_date
    ) AS order_number
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
ORDER BY c.customer_name, o.order_date;

WITH order_revenue AS (
    SELECT
        o.order_id,
        o.order_date,
        SUM(oi.quantity * p.price) AS order_total
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    JOIN products p
        ON oi.product_id = p.product_id
    GROUP BY o.order_id, o.order_date
)
SELECT
    order_id,
    order_date,
    order_total,
    SUM(order_total) OVER (
        ORDER BY order_date, order_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM order_revenue
ORDER BY order_date, order_id;

WITH customer_orders AS (
    SELECT
        o.order_id,
        o.customer_id,
        c.customer_name,
        o.order_date,
        LAG(o.order_date) OVER (
            PARTITION BY o.customer_id
            ORDER BY o.order_date
        ) AS previous_order_date,
        COUNT(*) OVER (
            PARTITION BY o.customer_id
        ) AS order_count
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
)
SELECT
    order_id,
    customer_name,
    order_date,
    previous_order_date,
    order_date - previous_order_date AS days_between_orders
FROM customer_orders
WHERE order_count > 1
ORDER BY customer_name, order_date;

