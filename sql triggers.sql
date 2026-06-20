create database triggers;
use triggers;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    salary DECIMAL(10,2),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO employees(employee_id, employee_name, salary)
VALUES
(101, 'Rahul', 30000),
(102, 'Priya', 35000),
(103, 'Amit', 40000);
DELIMITER //

CREATE TRIGGER trg_update_timestamp
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END//

DELIMITER ;

UPDATE employees
SET salary = 45000
WHERE employee_id = 103;

SELECT * FROM employees;


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    product_code VARCHAR(20)
);
INSERT INTO products
VALUES
(1, 'Laptop', 'LP001'),
(2, 'Mouse', 'MS001'),
(3, 'Keyboard', 'KB001');


DELIMITER //

CREATE TRIGGER trg_prevent_duplicate
BEFORE INSERT ON products
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT *
        FROM products
        WHERE product_name = NEW.product_name
        AND product_code = NEW.product_code
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Duplicate Product Not Allowed';
    END IF;
END//

DELIMITER ;
INSERT INTO products
VALUES (4, 'Monitor', 'MN001');


CREATE TABLE employee_salary (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    salary DECIMAL(10,2)
);

DELIMITER //

CREATE TRIGGER trg_default_salary
BEFORE INSERT ON employee_salary
FOR EACH ROW
BEGIN
    IF NEW.salary IS NULL THEN
        SET NEW.salary = 25000;
    END IF;
END//

DELIMITER ;


INSERT INTO employee_salary
VALUES
(101, 'Kiran', 35000),
(102, 'Anitha', NULL),
(103, 'Ravi', 45000),
(104, 'Sita', NULL);
SELECT * FROM employee_salary;
