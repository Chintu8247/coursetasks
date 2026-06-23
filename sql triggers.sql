use triggers;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    updated_at TIMESTAMP
);
DELIMITER //

CREATE TRIGGER trg_update_timestamp
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END //

DELIMITER ;

INSERT INTO employees
VALUES (1, 'Rahul', 30000, CURRENT_TIMESTAMP);
UPDATE employees
SET salary = 35000
WHERE emp_id = 1;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    product_code VARCHAR(20)
);
DELIMITER //

CREATE TRIGGER trg_prevent_duplicate_product
BEFORE INSERT ON products
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1
        FROM products
        WHERE product_name = NEW.product_name
          AND product_code = NEW.product_code
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Duplicate Product Not Allowed';
    END IF;
END //

DELIMITER ;

INSERT INTO products
VALUES (101, 'Laptop', 'LP001');

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2)
);
DELIMITER //

CREATE TRIGGER trg_default_salary
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
    IF NEW.salary IS NULL THEN
        SET NEW.salary = 25000;
    END IF;
END //

DELIMITER ;
INSERT INTO employee (emp_id, emp_name)
VALUES (2, 'Priya');
select*from employees;
