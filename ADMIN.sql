CREATE TABLE customers (
  customer_id NUMBER PRIMARY KEY,
  customer_name VARCHAR2(100),
  email VARCHAR2(100),
  city VARCHAR2(50)
);

CREATE TABLE products (
  product_id NUMBER PRIMARY KEY,
  product_name VARCHAR2(100),
  category VARCHAR2(50),
  price NUMBER(10,2)
);

CREATE TABLE orders (
  order_id NUMBER PRIMARY KEY,
  customer_id NUMBER REFERENCES customers(customer_id),
  order_date DATE
);

CREATE TABLE order_items (
  order_item_id NUMBER PRIMARY KEY,
  order_id NUMBER REFERENCES orders(order_id),
  product_id NUMBER REFERENCES products(product_id),
  quantity NUMBER
);

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

INSERT ALL
    INTO products (product_id, product_name, category, price)
    VALUES (1, 'Milk 1L', 'Dairy', 1200)
    INTO products (product_id, product_name, category, price)
    VALUES (2, 'Bread', 'Bakery', 1000)
    INTO products (product_id, product_name, category, price)
    VALUES (3, 'Rice 5kg', 'Grains', 6500)
    INTO products (product_id, product_name, category, price)
    VALUES (4, 'Cooking Oil 2L', 'Groceries', 5000)
    INTO products (product_id, product_name, category, price)
    VALUES (5, 'Eggs 12 Pack', 'Dairy', 2500)
    INTO products (product_id, product_name, category, price)
    VALUES (6, 'Sugar 2kg', 'Groceries', 2200)
    INTO products (product_id, product_name, category, price)
    VALUES (7, 'Biscuits', 'Snacks', 1500)
    INTO products (product_id, product_name, category, price)
    VALUES (8, 'Coffee 250g', 'Beverages', 3500)
SELECT 1 FROM dual;

COMMIT;

INSERT ALL
    INTO orders (order_id, customer_id, order_date)
    VALUES (1, 1, DATE '2026-09-01')
    INTO orders (order_id, customer_id, order_date)
    VALUES (2, 2, DATE '2026-09-02')
    INTO orders (order_id, customer_id, order_date)
    VALUES (3, 1, DATE '2026-09-03')
    INTO orders (order_id, customer_id, order_date)
    VALUES (4, 3, DATE '2026-09-04')
    INTO orders (order_id, customer_id, order_date)
    VALUES (5, 4, DATE '2026-09-05')
    INTO orders (order_id, customer_id, order_date)
    VALUES (6, 2, DATE '2026-09-06')
    INTO orders (order_id, customer_id, order_date)
    VALUES (7, 5, DATE '2026-09-07')
    INTO orders (order_id, customer_id, order_date)
    VALUES (8, 1, DATE '2026-09-08')
    INTO orders (order_id, customer_id, order_date)
    VALUES (9, 4, DATE '2026-09-09')
    INTO orders (order_id, customer_id, order_date)
    VALUES (10, 3, DATE '2026-09-10')
    INTO orders (order_id, customer_id, order_date)
    VALUES (11, 2, DATE '2026-09-11')
    INTO orders (order_id, customer_id, order_date)
    VALUES (12, 5, DATE '2026-09-12')
    INTO orders (order_id, customer_id, order_date)
    VALUES (13, 1, DATE '2026-09-13')
    INTO orders (order_id, customer_id, order_date)
    VALUES (14, 4, DATE '2026-09-14')
    INTO orders (order_id, customer_id, order_date)
    VALUES (15, 2, DATE '2026-09-15')
SELECT 1 FROM dual;

COMMIT;

INSERT ALL
    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (1, 1, 1, 2)
    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (2, 1, 2, 1)

    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (3, 2, 3, 1)
    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (4, 2, 5, 2)

    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (5, 3, 4, 1)
    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (6, 3, 6, 2)

    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (7, 4, 7, 3)
    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (8, 4, 8, 1)

    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (9, 5, 3, 2)
    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (10, 5, 4, 1)

    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (11, 6, 1, 3)
    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (12, 6, 7, 2)

    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (13, 7, 2, 2)
    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (14, 7, 6, 1)

    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (15, 8, 5, 2)
    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (16, 8, 8, 1)

    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (17, 9, 4, 2)
    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (18, 9, 3, 1)

    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (19, 10, 7, 2)
    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (20, 10, 2, 1)

    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (21, 11, 6, 3)
    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (22, 11, 1, 2)

    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (23, 12, 8, 2)
    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (24, 12, 5, 1)

    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (25, 13, 3, 1)
    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (26, 13, 4, 2)

    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (27, 14, 7, 3)
    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (28, 14, 6, 2)

    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (29, 15, 8, 1)
    INTO order_items (order_item_id, order_id, product_id, quantity) VALUES (30, 15, 3, 2)
SELECT 1 FROM dual;

COMMIT;


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

