-- Task 1: Insert a single record into students table
INSERT INTO students (id, name, age, city)
VALUES (1, 'Rahul', 20, 'Hyderabad');

-- Task 2: Insert a single record into employees table without specifying column names
INSERT INTO employees
VALUES (101, 'Vinay', 45000.00, 'HR');

-- Task 3: Insert 3 records at once into products table
INSERT INTO products (product_id, product_name, price)
VALUES
(1, 'Laptop', 55000.00),
(2, 'Mouse', 800.00),
(3, 'Keyboard', 1500.00);

-- Task 4: Insert a record into appointments table with DATE and TIME values
INSERT INTO appointments (appointment_id, patient_name, appointment_date, appointment_time)
VALUES (1, 'Ravi', '2026-05-24', '10:30:00');

-- Task 5: Insert 2 records into orders table with DATETIME and TIMESTAMP values
INSERT INTO orders (order_id, customer_name, order_datetime, created_timestamp)
VALUES
(1, 'Anil', '2026-05-24 14:30:00', CURRENT_TIMESTAMP),
(2, 'Sneha', '2026-05-24 16:00:00', CURRENT_TIMESTAMP);


-- Task 1: Update city of student with id = 2
UPDATE students
SET city = 'Bangalore'
WHERE id = 2;

-- Task 2: Increase salary of all HR employees by 5000
UPDATE employees
SET salary = salary + 5000
WHERE department = 'HR';

-- Task 3: Update all product prices to 0
UPDATE products
SET price = 0;

-- Task 4: Update appointment_date for appointment with id = 1
UPDATE appointments
SET appointment_date = '2024-07-20'
WHERE id = 1;

-- Task 1: Delete the student with id = 3
DELETE FROM students
WHERE id = 3;

-- Task 2: Delete all employees from Finance department
DELETE FROM employees
WHERE department = 'Finance';

-- Task 3: Delete all records from products table
DELETE FROM products;

-- Task 4: Delete appointments before 2024-06-01
DELETE FROM appointments
WHERE appointment_date < '2024-06-01';

-- Task 5: Delete orders where shipped_at is NULL
DELETE FROM orders
WHERE shipped_at IS NULL;