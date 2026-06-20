CREATE DATABASE task14;
USE task14;
CREATE TABLE employees(
id INT PRIMARY KEY ,
sno INT UNIQUE AUTO_INCREMENT,
salary DECIMAL(10,2),
address TEXT,
status BOOLEAN,
department VARCHAR(100))
AUTO_INCREMENT = 101;
 INSERT INTO employees (id,salary,address,status,department) VALUES 
(1,10000,"HYD",1,"CSE"),
(2,20000,"HYD",0,"CSE");

INSERT INTO employees (id,salary,address,status,department) VALUES 
(3,15000,"MABD",1,"CSE");

INSERT INTO employees (id,salary,address,status,department) VALUES 
(4,9000,"CHENNAI",0,"EEE"),
(5,20000,"BHOPAL",1,"AIML"),
(6,14500,"MABD",1,"ECE");
SET SQL_SAFE_UPDATES = 0;
SELECT * FROM employees;
UPDATE employees
SET salary = salary + 1000
WHERE salary > 20000;
RENAME TABLE employees TO employee_details;
ALTER TABLE employee_details
ADD email VARCHAR(100);
UPDATE employee_details
SET email =
CASE
    WHEN id = 1 THEN 'emp1@gmail.com'
    WHEN id = 2 THEN 'emp2@gmail.com'
    WHEN id = 3 THEN 'emp3@gmail.com'
    WHEN id = 4 THEN 'emp4@gmail.com'
    WHEN id = 5 THEN 'emp5@gmail.com'
    WHEN id = 6 THEN 'emp6@gmail.com'

END;

ALTER TABLE employee_details
MODIFY status VARCHAR(20);

DELETE e FROM employee_details e
JOIN (SELECT department,AVG(salary) AS avg_salary FROM employee_details GROUP BY department) t
ON e.department = t.department
WHERE e.salary < t.avg_salary;

SELECT * FROM employee_details;

SELECT department, count(*) FROM employee_details GROUP BY department;

SELECT COUNT(*) FROM employee_details WHERE department = "CSE";

-- gender ENUM('Male','Female','Other');--

-- skills SET('Java','Python','SQL','C++');--

SELECT salary FROM employee_details ORDER BY salary DESC LIMIT 1 OFFSET 1;

SELECT id, salary FROM employee_details WHERE salary = (SELECT max(salary) FROM employee_details WHERE salary < (SELECT MAX(salary) FROM employee_details));

SELECT MAX(salary)
FROM employee_details
WHERE salary <
(
    SELECT MAX(salary)
    FROM employee_details
);

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    id INT,
    FOREIGN KEY (id)
    REFERENCES employee_details(id)
);


DESC departments;