CREATE DATABASE task11;
USE task11;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO departments VALUES
(101,'HR','Hyderabad'),
(102,'IT','Bangalore'),
(103,'Finance','Chennai'),
(104,'Sales','Hyderabad'),
(105,'Marketing','Mumbai');


CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT
);

INSERT INTO employees VALUES
(1,'Ravi',60000,102),
(2,'Sai',45000,101),
(3,'Priya',70000,102),
(4,'Kiran',55000,104),
(5,'Anu',40000,NULL),
(6,'Rahul',80000,103),
(7,'Neha',50000,NULL);


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    phone VARCHAR(15)
);

INSERT INTO customers VALUES
(1,'Arjun','9876543210'),
(2,'Sneha','9123456789'),
(3,'Vikram',NULL),
(4,'Meena','9988776655'),
(5,'Raj',NULL);

-- Orders
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10,2)
);

INSERT INTO orders VALUES
(101,1,3000),
(102,1,6000),
(103,2,7000),
(104,2,4000),
(105,2,8000),
(106,2,9000),
(107,3,2000);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    amount DECIMAL(10,2),
    status VARCHAR(20)
);

INSERT INTO payments VALUES
(1,101,3000,'Completed'),
(2,102,6000,'Completed'),
(3,103,7000,'Pending'),
(4,999,5000,'Completed'),
(5,NULL,2000,'Pending');


CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

INSERT INTO categories VALUES
(1,'Electronics'),
(2,'Clothing'),
(3,'Books');


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2),
    category_id INT
);

INSERT INTO products VALUES
(1,'Laptop',50000,1),
(2,'Mobile',25000,1),
(3,'Shirt',1500,2),
(4,'Book',500,3),
(5,'Watch',3000,NULL);


CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT
);

INSERT INTO order_items VALUES
(1,101,1,1),
(2,102,2,2),
(3,103,3,5),
(4,104,1,1),
(5,105,4,10);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

INSERT INTO courses VALUES
(1,'Python'),
(2,'Java'),
(3,'SQL');

-- Students
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

INSERT INTO students VALUES
(1,'Ajay'),
(2,'Divya'),
(3,'Karthik'),
(4,'Pooja');


CREATE TABLE enrollments (
    student_id INT,
    course_id INT
);

INSERT INTO enrollments VALUES
(1,1),
(2,2),
(3,1),
(3,3);

CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY,
    student_id INT,
    attendance_date DATE
);

INSERT INTO attendance VALUES
(1,1,'2025-05-01'),
(2,2,'2025-05-01');


CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50)
);

INSERT INTO projects VALUES
(1,'ERP'),
(2,'CRM'),
(3,'Banking');

CREATE TABLE employee_projects (
    emp_id INT,
    project_id INT
);

INSERT INTO employee_projects VALUES
(1,1),
(1,2),
(3,3),
(4,1);


CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(50)
);

INSERT INTO suppliers VALUES
(1,'ABC Suppliers'),
(2,'XYZ Traders');


CREATE TABLE product_suppliers (
    product_id INT,
    supplier_id INT
);

INSERT INTO product_suppliers VALUES
(1,1),
(2,2),
(3,1);


CREATE TABLE salary_history (
    salary_id INT PRIMARY KEY,
    emp_id INT,
    salary DECIMAL(10,2),
    effective_date DATE
);

INSERT INTO salary_history VALUES
(1,1,55000,'2024-01-01'),
(2,1,60000,'2025-01-01'),
(3,2,45000,'2025-01-01'),
(4,3,70000,'2025-01-01');


CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50)
);

INSERT INTO users VALUES
(1,'user1'),
(2,'user2'),
(3,'user3');


CREATE TABLE login_history (
    login_id INT PRIMARY KEY,
    user_id INT,
    login_date DATE
);

INSERT INTO login_history VALUES
(1,1,'2025-05-01'),
(2,2,'2025-05-02');


CREATE TABLE invoices (
    invoice_id INT PRIMARY KEY,
    order_id INT,
    amount DECIMAL(10,2)
);

INSERT INTO invoices VALUES
(1,101,3000),
(2,102,6000),
(3,999,5000);

-- Shipments
CREATE TABLE shipments (
    shipment_id INT PRIMARY KEY,
    order_id INT,
    shipment_date DATE
);

INSERT INTO shipments VALUES
(1,101,'2025-05-10'),
(2,104,'2025-05-12'),
(3,999,'2025-05-15');

-- Transactions
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2)
);

INSERT INTO transactions VALUES
(1,1,1000),
(2,2,2500),
(3,999,3000);


SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM payments;
SELECT * FROM categories;
SELECT * FROM products;
SELECT * FROM order_items;
SELECT * FROM courses;
SELECT * FROM students;
SELECT * FROM enrollments;
SELECT * FROM attendance;
SELECT * FROM projects;
SELECT * FROM employee_projects;
SELECT * FROM suppliers;
SELECT * FROM product_suppliers;
SELECT * FROM salary_history;
SELECT * FROM users;
SELECT * FROM login_history;
SELECT * FROM invoices;
SELECT * FROM shipments;
SELECT * FROM transactions;


SELECT e.emp_name,d.dept_name FROM employees e INNER JOIN departments d ON e.dept_id = d.dept_id;

SELECT c.customer_name,o.order_id FROM orders o INNER JOIN customers c ON o.customer_id = c.customer_id;

SELECT c.customer_name,o.order_id FROM orders o INNER JOIN customers c ON o.customer_id = c.customer_id;

SELECT s.*,e.course_id FROM enrollments e INNER JOIN students s ON e.student_id = e.student_id;

SELECT o.order_id , p.product_id,p.product_name FROM order_items o INNER JOIN products p ON o.product_id = p.product_id;

SELECT s.*,e.emp_name FROM salary_history s INNER JOIN employees e ON s.emp_id = e.emp_id;

SELECT e.emp_name, d.dept_name FROM employees e INNER JOIN departments d ON e.dept_id = d.dept_id WHERE dept_name = "IT";

SELECT c.customer_name,o.order_amount FROM orders o INNER JOIN customers c ON c.customer_id = o.customer_id WHERE order_amount > 5000;

SELECT c.customer_id,c.customer_name,count(o.order_id) AS orders_count FROM orders o INNER JOIN customers c ON c.customer_id = o.customer_id GROUP BY c.customer_id, c.customer_name ;

SELECT s.salary,e.emp_name FROM salary_history s INNER JOIN employees e ON s.emp_id = e.emp_id WHERE e.salary > 50000;

SELECT s.student_name,c.course_name
FROM students s
INNER JOIN enrollments e
ON s.student_id = e.student_id
INNER JOIN courses c
ON e.course_id = c.course_id
WHERE c.course_name = 'Python';


SELECT e.emp_name,d.dept_id,d.dept_name, e.salary FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id 
WHERE (e.dept_id,e.salary) IN (SELECT dept_id,MAX(salary) FROM employees GROUP BY dept_id);

SELECT e.emp_name, d.location FROM employees e INNER JOIN departments d ON e.dept_id = d.dept_id WHERE location = "Hyderabad" ;

SELECT c.customer_id,c.customer_name,count(o.order_id) AS orders_count FROM orders o INNER JOIN customers c ON c.customer_id = o.customer_id GROUP BY c.customer_id, c.customer_name  HAVING count(order_id) > 2;

SELECT p.product_id,p.product_name,o.quantity FROM order_items o INNER JOIN products p ON o.product_id = p.product_id;

SELECT e.emp_id,
       e.emp_name,
       s.salary
FROM employees e
INNER JOIN salary_history s
ON e.emp_id = s.emp_id
WHERE s.salary >
(
    SELECT AVG(salary)
    FROM salary_history
);


SELECT e.emp_name,d.dept_name FROM employees e LEFT JOIN departments d ON e.dept_id = d.dept_id;

SELECT o.order_id,p.* FROM orders o LEFT JOIN payments p ON o.order_id = p.order_id;

SELECT p.product_id,
       p.product_name,
       c.category_name
FROM products p
LEFT JOIN categories c
ON p.category_id = c.category_id;

SELECT s.student_id,
       s.student_name,
       a.attendance_date
FROM students s
LEFT JOIN attendance a
ON s.student_id = a.student_id;

SELECT e.emp_name,e.emp_id,d.dept_id FROM employees e LEFT JOIN departments d ON e.dept_id = d.dept_id WHERE d.dept_id IS NULL;

SELECT o.order_id ,o.order_amount,p.payment_id,p.status FROM orders o LEFT JOIN payments p ON o.order_id = p.order_id WHERE p.status = "Pending" or p.status IS Null;
 
SELECT c.customer_id,c.customer_name,o.order_id FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id 
WHERE o.order_id IS NULL;

 SELECT p.product_id,
       p.product_name
FROM products p
LEFT JOIN product_suppliers ps
ON p.product_id = ps.product_id
WHERE ps.supplier_id IS NULL;

SELECT e.emp_id,e.emp_name,count(ep.project_id) AS project_count FROM employees e LEFT JOIN employee_projects ep ON e.emp_id = ep.emp_id
GROUP BY e.emp_id ,e.emp_name HAVING project_count >=0;

SELECT DISTINCT c.customer_id,
                c.customer_name
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
LEFT JOIN payments p
ON o.order_id = p.order_id
WHERE p.payment_id IS NULL;

SELECT e.emp_id,
       e.emp_name,
       MAX(s.salary) AS latest_salary
FROM employees e
LEFT JOIN salary_history s
ON e.emp_id = s.emp_id
GROUP BY e.emp_id, e.emp_name;


SELECT p.product_id,
       p.product_name,
       COALESCE(SUM(oi.quantity * p.price),0) AS total_sales
FROM products p
LEFT JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;


SELECT u.user_id,
       u.username
FROM users u
LEFT JOIN login_history l
ON u.user_id = l.user_id
WHERE l.login_id IS NULL;


SELECT d.dept_id,
       d.dept_name,
       COUNT(e.emp_id) AS employee_count
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name;

SELECT p.payment_id,
       p.amount,
       o.order_id
FROM orders o
RIGHT JOIN payments p
ON o.order_id = p.order_id;


SELECT t.transaction_id,
       t.amount,
       c.customer_name
FROM customers c
RIGHT JOIN transactions t
ON c.customer_id = t.customer_id;

SELECT i.invoice_id,
       i.amount,
       o.order_id
FROM orders o
RIGHT JOIN invoices i
ON o.order_id = i.order_id;

SELECT a.attendance_id,
       a.attendance_date,
       s.student_name
FROM students s
RIGHT JOIN attendance a
ON s.student_id = a.student_id;

SELECT sh.shipment_id,
       sh.shipment_date,
       o.order_id
FROM orders o
RIGHT JOIN shipments sh
ON o.order_id = sh.order_id;


SELECT p.payment_id,
       p.amount,
       o.order_id,
       o.order_amount
FROM orders o
RIGHT JOIN payments p
ON o.order_id = p.order_id;

SELECT t.transaction_id,
       t.amount,
       c.customer_name
FROM customers c
RIGHT JOIN transactions t
ON c.customer_id = t.customer_id;


SELECT b.booking_id,
       u.username
FROM users u
RIGHT JOIN bookings b
ON u.user_id = b.user_id;

SELECT p.payment_id,
       p.amount
FROM orders o
RIGHT JOIN payments p
ON o.order_id = p.order_id
WHERE o.order_id IS NULL;

SELECT t.transaction_id,
       t.amount,
       c.customer_name
FROM customers c
RIGHT JOIN transactions t
ON c.customer_id = t.customer_id
WHERE c.customer_id IS NULL;