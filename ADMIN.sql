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