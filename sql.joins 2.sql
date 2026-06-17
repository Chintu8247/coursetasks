create database joins;
use joins;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO departments VALUES
(1,'HR'),
(2,'IT'),
(3,'Finance');

INSERT INTO employees VALUES
(101,'Ravi',1),
(102,'Priya',2),
(103,'Arjun',2),
(104,'Sneha',3);
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers VALUES
(1,'Amit'),
(2,'Neha'),
(3,'Kiran');

INSERT INTO orders VALUES
(1001,1,'2025-06-01'),
(1002,2,'2025-06-02'),
(1003,1,'2025-06-03');
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
INSERT INTO students VALUES
(1,'Rahul'),
(2,'Anjali'),
(3,'Vikram');

INSERT INTO courses VALUES
(101,'Python'),
(102,'SQL'),
(103,'Java');

INSERT INTO enrollments VALUES
(1,1,101),
(2,1,102),
(3,2,103);
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO products VALUES
(1,'Laptop'),
(2,'Mouse'),
(3,'Keyboard');

INSERT INTO order_items VALUES
(1,1001,1,1),
(2,1001,2,2),
(3,1002,3,1);

CREATE TABLE employee_details (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50)
);

CREATE TABLE salaries (
    salary_id INT PRIMARY KEY,
    employee_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (employee_id) REFERENCES employee_details(employee_id)
);
INSERT INTO employee_details VALUES
(1,'Ramesh'),
(2,'Suresh'),
(3,'Mahesh');

INSERT INTO salaries VALUES
(101,1,45000),
(102,2,55000),
(103,3,60000);
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
INSERT INTO departments VALUES
(1,'HR'),
(2,'IT'),
(3,'Finance');

INSERT INTO employees VALUES
(101,'Ravi',1),
(102,'Priya',2),
(103,'Arjun',2),
(104,'Sneha',3);

select*from departments;
select*from employees;
select*from orders;
select*from customers;
select*from students;
select*from courses;
select*from enrollments;
select*from products;
select*from order_items;
select*from employee_details;
select*from salaries;
select*from departments;
select*from employees;




select employees.employee_name,departments.department_name from employees inner join departments on employees.department_id=departments.department_id;

SELECT o.order_id, c.customer_name
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id;

SELECT s.student_id,
       s.student_name,
       c.course_name
FROM students s
INNER JOIN enrollments e
ON s.student_id = e.student_id
INNER JOIN courses c
ON e.course_id = c.course_id;


SELECT p.product_id,
       p.product_name,
       oi.order_id
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id;

select  employee_details.employee_id,employee_name,salaries.salary from 
employee_details inner join salaries on 
employee_details.employee_id=salaries.employee_id;


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO customers VALUES
(1,'Amit'),
(2,'Neha'),
(3,'Kiran');

INSERT INTO orders VALUES
(101,1,7000),
(102,2,3500),
(103,3,9000),
(104,1,4500);


SELECT e.employee_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_name = 'IT';


SELECT c.customer_id,
       c.customer_name,
       o.order_amount
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_amount > 5000;

 SELECT c.customer_id,
       c.customer_name,
       COUNT(o.order_id) AS total_orders
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;


CREATE TABLE employees_salary (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50)
);
CREATE TABLE salaries (
    salary_id INT PRIMARY KEY,
    employee_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (employee_id) REFERENCES employees_salary(employee_id)
);

INSERT INTO employees_salary VALUES
(1,'Ramesh'),
(2,'Suresh'),
(3,'Mahesh'),
(4,'Priya');

INSERT INTO salaries VALUES
(101,1,45000),
(102,2,55000),
(103,3,60000),
(104,4,48000);

select*from salaries;
select*from employees_salary;
SELECT e.employee_name,
       s.salary
FROM employees_salary e
INNER JOIN salaries s
ON e.employee_id = s.employee_id
WHERE s.salary > 50000;

SELECT s.student_id,
       s.student_name,
       c.course_name
FROM students s
INNER JOIN enrollments e
ON s.student_id = e.student_id
INNER JOIN courses c
ON e.course_id = c.course_id
WHERE c.course_name = 'Python';

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO departments VALUES
(1,'HR','Hyderabad'),
(2,'IT','Bangalore'),
(3,'Finance','Hyderabad');

INSERT INTO employees VALUES
(101,'Ravi',1),
(102,'Priya',2),
(103,'Arjun',3),
(104,'Sneha',2);

SELECT e.employee_name,
       d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
WHERE d.location = 'Hyderabad';

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2)
);
INSERT INTO employees VALUES
(101,'Ravi',1,45000),
(102,'Priya',1,60000),
(103,'Arjun',2,55000),
(104,'Sneha',2,70000),
(105,'Kiran',3,50000);
select *from employees;
SELECT department_id,
       MAX(salary) AS highest_salary
FROM employees
GROUP BY department_id;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO customers VALUES
(1,'Amit'),
(2,'Neha'),
(3,'Kiran');

INSERT INTO orders VALUES
(101,1,2000),
(102,1,3000),
(103,1,1500),
(104,1,5000),
(105,2,2500),
(106,3,4500);

SELECT c.customer_id,
       c.customer_name,
       COUNT(o.order_id) AS total_orders
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 3;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
);
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO products VALUES
(1,'Laptop'),
(2,'Mouse'),
(3,'Keyboard');

INSERT INTO order_items VALUES
(1,1,2),
(2,1,1),
(3,2,5),
(4,3,3),
(5,2,2);
select*from products;
select*from order_items;
SELECT p.product_name,
       SUM(oi.quantity) AS total_quantity_sold
FROM products p
INNER JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_name;


CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    salary DECIMAL(10,2)
);
INSERT INTO employees VALUES
(101,'Ravi',40000),
(102,'Priya',60000),
(103,'Arjun',55000),
(104,'Sneha',70000),
(105,'Kiran',45000);

SELECT employee_name,
       salary
FROM employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT
);
INSERT INTO departments VALUES
(1,'HR'),
(2,'IT'),
(3,'Finance');

INSERT INTO employees VALUES
(101,'Ravi',1),
(102,'Priya',2),
(103,'Arjun',NULL),
(104,'Sneha',3);
select*from departments;
select* from employees;
SELECT e.employee_name,
       d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_amount DECIMAL(10,2)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_amount DECIMAL(10,2)
);
INSERT INTO orders VALUES
(101,5000),
(102,3000),
(103,7000);

INSERT INTO payments VALUES
(1,101,5000),
(2,103,7000);

select*from orders;
select*from payments;
SELECT o.order_id,
       o.order_amount,
       p.payment_amount
FROM orders o
LEFT JOIN payments p
ON o.order_id = p.order_id;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE contacts (
    customer_id INT,
    phone_number VARCHAR(20)
);
INSERT INTO customers VALUES
(1,'Amit'),
(2,'Neha'),
(3,'Kiran');

INSERT INTO contacts VALUES
(1,'9876543210'),
(3,'9123456789');
SELECT c.customer_name,
       ct.phone_number
FROM customers c
LEFT JOIN contacts ct
ON c.customer_id = ct.customer_id;

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category_id INT
);
INSERT INTO categories VALUES
(1,'Electronics'),
(2,'Accessories');

INSERT INTO products VALUES
(101,'Laptop',1),
(102,'Mouse',2),
(103,'Keyboard',NULL);
SELECT p.product_name,
       c.category_name
FROM products p
LEFT JOIN categories c
ON p.category_id = c.category_id;
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY,
    student_id INT,
    attendance_date DATE,
    status VARCHAR(10)
);
INSERT INTO students VALUES
(1,'Rahul'),
(2,'Anjali'),
(3,'Vikram');

INSERT INTO attendance VALUES
(101,1,'2025-06-01','Present'),
(102,2,'2025-06-01','Absent');
SELECT s.student_name,
       a.attendance_date,
       a.status
FROM students s
LEFT JOIN attendance a
ON s.student_id = a.student_id;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT
);
INSERT INTO departments VALUES
(1,'HR'),
(2,'IT'),
(3,'Finance');

INSERT INTO employees VALUES
(101,'Ravi',1),
(102,'Priya',2),
(103,'Arjun',NULL),
(104,'Sneha',3);

select*from departments;
select*from employees;
SELECT *
FROM employees
WHERE department_id IS NULL;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_amount DECIMAL(10,2)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_amount DECIMAL(10,2)
);
INSERT INTO orders VALUES
(101,5000),
(102,3000),
(103,7000),
(104,2500);

INSERT INTO payments VALUES
(1,101,5000),
(2,103,7000);
select*from orders;
select*from payments;

SELECT o.order_id,
       o.order_amount
FROM orders o
LEFT JOIN payments p
ON o.order_id = p.order_id
WHERE p.order_id IS NULL;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT
); 
INSERT INTO customers VALUES
(1,'Amit'),
(2,'Neha'),
(3,'Kiran'),
(4,'Rohit');
INSERT INTO orders VALUES
(101,1),
(102,2),
(103,1);
 select*from customers;
 select*from orders;
SELECT c.customer_id,
       c.customer_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;

CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    supplier_id INT
);
INSERT INTO suppliers VALUES
(1,'ABC Suppliers'),
(2,'XYZ Traders');

INSERT INTO products VALUES
(101,'Laptop',1),
(102,'Mouse',2),
(103,'Keyboard',NULL),
(104,'Monitor',NULL);
select*from suppliers;
select*from  products;
SELECT *
FROM products
WHERE supplier_id IS NULL;


CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50)
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50)
);

CREATE TABLE employee_projects (
    employee_id INT,
    project_id INT
);
INSERT INTO employees VALUES
(101,'Ravi'),
(102,'Priya'),
(103,'Arjun'),
(104,'Sneha');

INSERT INTO projects VALUES
(1,'Banking App'),
(2,'E-Commerce'),
(3,'ERP System');
INSERT INTO employee_projects VALUES
(101,1),
(101,2),
(102,2),
(103,3);
select*from employees;
select*from projects;
select*from employee_projects;
SELECT e.employee_id,
       e.employee_name,
       COUNT(ep.project_id) AS total_projects
FROM employees e
LEFT JOIN employee_projects ep
ON e.employee_id = ep.employee_id
GROUP BY e.employee_id, e.employee_name;







