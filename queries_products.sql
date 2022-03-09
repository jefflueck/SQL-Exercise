-- Comments in SQL Start with dash-dash --

-- Products DB
-- 1
INSERT INTO products (name, price, can_be_returned) VALUES ('chair', 44.00, 'false');

-- 2
INSERT INTO products (name, price, can_be_returned) VALUES ('stool', 25.99, 'true');

-- 3
INSERT INTO products (name, price, can_be_returned) VALUES ('table', 124.00, 'false');

-- 4
SELECT * FROM products;

-- 5
SELECT name FROM products;

-- 6
SELECT name, price FROM products;

-- 7
INSERT INTO products (name, price, can_be_returned) VALUES ('TV', 400.00, 'false');

-- 8
SELECT name FROM products WHERE can_be_returned = 'f';

-- 9
SELECT name FROM products WHERE price < 44.00;

-- 10
SELECT name FROM products WHERE price > 22.50 and price < 99.99;

-- 11
products_db=# UPDATE products SET price = price - 20;
-- Output:
UPDATE 4
products_db=# SELECT price FROM products;
       price
-------------------
                24
 5.989999999999998
               104
               380
(4 rows)

-- 12
products_db=# DELETE FROM products WHERE price < 25;
-- Output:
DELETE 2
products_db=# SELECT * FROM products;
 id | name  | price | can_be_returned
----+-------+-------+-----------------
  3 | table |   104 | f
  4 | TV    |   380 | f
(2 rows)

-- 13
products_db=# UPDATE products SET price = price + 20;
-- Output:
UPDATE 2
products_db=# SELECT * FROM products;
 id | name  | price | can_be_returned
----+-------+-------+-----------------
  3 | table |   124 | f
  4 | TV    |   400 | f
(2 rows)

-- 14
products_db=# UPDATE products SET can_be_returned = 'true';
-- Output:
UPDATE 2
products_db=# SELECT * FROM products;
 id | name  | price | can_be_returned
----+-------+-------+-----------------
  3 | table |   124 | t
  4 | TV    |   400 | t
(2 rows)
