CREATE DATABASE employe;

USE employe;

CREATE TABLE employe(
    empl_id INT,
    empl_name VARCHAR(100),
    salary DECIMAL(10,2)
);

INSERT INTO employe
VALUES
(1,'vinay',2500),
(2,'chintu',5000),
(3,'chinni',4000);

CREATE DATABASE projects;
create  database projects;
use projects;
create  table projects(
               pro_id int,
               name varchar(100));
insert into projects values(1,'ml'),(2,'dev');
 

SELECT *
FROM employe.employe e
left JOIN projects.projects p
ON e.empl_id = p.pro_id;

select min(salary) from employe
where salary=(salary)from  employe-- Task 1
CREATE DATABASE school_db;

-- Task 2
USE school_db;

CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);

-- Task 3
CREATE DATABASE company_db;

-- Task 4
USE company_db;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    salary DECIMAL(10,2),
    department VARCHAR(50)
);

-- Task 5
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price FLOAT
);

-- Task 6
CREATE DATABASE library_db;

-- Task 7
USE library_db;

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(150),
    author VARCHAR(100),
    price DECIMAL(8,2)
);

-- Task 8
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    order_date DATE,
    amount DECIMAL(10,2)
);

-- Task 9
CREATE DATABASE college_db;

-- Task 10
USE college_db;

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    duration INT
);


     
