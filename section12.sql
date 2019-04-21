#Udemy The Ultimate MySQL Bootcamp Colt Steele 2018.02.19


CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);
CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);
##foreign keys are a way to reference the column of an existing table in another
##first declare column and then assign foreign key and where to reference
##"FOREIGN KEY 'column_name' REFERENCES table('original_column_name')
##it is standard to name the foreign key column with tableName_columnName

#Q: select all orders made by customer george

SELECT * FROM customers WHERE last_name='george';
SELECT * FROM orders WHERE customer_id = 1;
#we can do 2 queries, find customer id from customers then use id to find orders

SELECT * FROM orders WHERE customer_id =
    (
        SELECT id FROM customers
        WHERE last_name='george'
    );
#we can also do a subquery with same logic
#or we can do join the tables

SELECT * FROM customers, orders
WHERE customers.id = orders.customer_id;
#implicit inner join

SELECT * FROM customers
JOIN orders ON customers.id = orders.customer_id;
#explicit inner join

SELECT first_name, last_name, order_date, amount FROM customers
JOIN orders ON customers.id = orders.customer_id
GROUP BY first_name, last_name, order_date, amount ORDER BY amount DESC;

SELECT first_name, last_name, SUM(amount) AS total_spent FROM customers
JOIN orders ON customers.id = orders.customer_id
GROUP BY first_name, last_name ORDER BY 3 DESC;

SELECT * FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id;
#explicit LEFT JOIN

SELECT first_name, last_name, SUM(amount) AS total_spent FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY first_name, last_name ORDER BY 3 DESC;

SELECT first_name, last_name, IFNULL(SUM(amount), 0) AS total_spent FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY first_name, last_name ORDER BY 3 DESC;
#IFNULL funcion takes 2 args, the column you are checking for null and what to replace value with

