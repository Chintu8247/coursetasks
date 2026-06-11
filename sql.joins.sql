CREATE TABLE company (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(50)
);
INSERT INTO company VALUES
(1,'TCS'),
(2,'Infosys'),
(3,'Wipro');

CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50),
    company_id INT
);

INSERT INTO department VALUES
(101,'HR','Hyderabad',1),
(102,'IT','Bangalore',1),
(103,'Finance','Mumbai',2),
(104,'Marketing','Chennai',3);

CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    salary INT,
    department_id INT
);
INSERT INTO employee VALUES
(1,'Vinay',55000,101),
(2,'Rahul',70000,102),
(3,'Priya',45000,103),
(4,'Anil',60000,101),
(5,'Sneha',80000,104),
(6,'Kiran',50000,102);
select*from company;
select*from  department;
select*from  employee;

SELECT e.employee_name, d.department_name
FROM employee e
INNER JOIN department d
ON e.department_id = d.department_id;

SELECT e.employee_name, e.salary, c.company_name
FROM employee e
INNER JOIN department d
ON e.department_id = d.department_id
INNER JOIN company c
ON d.company_id = c.company_id;

SELECT e.*
FROM employee e
INNER JOIN department d
ON e.department_id = d.department_id;

SELECT e.*, d.location
FROM employee e
INNER JOIN department d
ON e.department_id = d.department_id;


SELECT e.*
FROM employee e
INNER JOIN department d
ON e.department_id = d.department_id
WHERE d.department_name = 'HR';


SELECT e.employee_name, c.company_name
FROM employee e
INNER JOIN department d
ON e.department_id = d.department_id
INNER JOIN company c
ON d.company_id = c.company_id;

SELECT e.*
FROM employee e
INNER JOIN department d
ON e.department_id = d.department_id
INNER JOIN company c
ON d.company_id = c.company_id;

SELECT e.*, d.*, c.*
FROM employee e
INNER JOIN department d
ON e.department_id = d.department_id
INNER JOIN company c
ON d.company_id = c.company_id;



SELECT e.employee_name, d.department_name
FROM employee e
INNER JOIN department d
ON e.department_id = d.department_id
WHERE e.salary > 50000;

SELECT e.*
FROM employee e
INNER JOIN department d
ON e.department_id = d.department_id
INNER JOIN company c
ON d.company_id = c.company_id
WHERE c.company_name = 'TCS';






CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    movie_name VARCHAR(50),
    show_time VARCHAR(20)
);

INSERT INTO movies VALUES
(1,'Pushpa 2','10:00 AM'),
(2,'Kalki 2898 AD','02:00 PM'),
(3,'Salaar','06:00 PM'),
(4,'RRR','09:00 PM');

CREATE TABLE theatres (
    theatre_id INT PRIMARY KEY,
    theatre_name VARCHAR(50),
    location VARCHAR(50)
);
INSERT INTO theatres VALUES
(101,'PVR Cinemas','Hyderabad'),
(102,'INOX','Warangal'),
(103,'Asian Cinemas','Karimnagar');


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);
INSERT INTO customers VALUES
(1,'Vinay'),
(2,'Rahul'),
(3,'Priya'),
(4,'Sneha');



CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    customer_id INT,
    movie_id INT,
    theatre_id INT,
    booking_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (theatre_id) REFERENCES theatres(theatre_id)
);


INSERT INTO bookings VALUES
(1001,1,1,101,'2025-06-01'),
(1002,2,2,102,'2025-06-02'),
(1003,3,1,101,'2025-06-03'),
(1004,4,3,103,'2025-06-04'),
(1005,1,2,102,'2025-06-05');

SELECT b.booking_id,
       m.movie_name
FROM bookings b
INNER JOIN movies m
ON b.movie_id = m.movie_id;

SELECT m.movie_name,
       t.theatre_name
FROM bookings b
INNER JOIN movies m
ON b.movie_id = m.movie_id
INNER JOIN theatres t
ON b.theatre_id = t.theatre_id;




SELECT c.customer_name,
       m.movie_name
FROM bookings b
INNER JOIN customers c
ON b.customer_id = c.customer_id
INNER JOIN movies m
ON b.movie_id = m.movie_id;

SELECT DISTINCT m.movie_name
FROM movies m
INNER JOIN bookings b
ON m.movie_id = b.movie_id;

SELECT b.booking_id,
       t.location
FROM bookings b
INNER JOIN theatres t
ON b.theatre_id = t.theatre_id;

SELECT m.movie_name,
       m.show_time,
       t.theatre_name
FROM bookings b
INNER JOIN movies m
ON b.movie_id = m.movie_id
INNER JOIN theatres t
ON b.theatre_id = t.theatre_id;

SELECT *
FROM bookings b
INNER JOIN movies m
ON b.movie_id = m.movie_id
WHERE m.movie_name = 'Pushpa 2';

SELECT DISTINCT t.theatre_name
FROM theatres t
INNER JOIN bookings b
ON t.theatre_id = b.theatre_id;

SELECT m.movie_name,
       COUNT(b.booking_id) AS total_bookings
FROM movies m
INNER JOIN bookings b
ON m.movie_id = b.movie_id
GROUP BY m.movie_name;

SELECT b.booking_id,
       m.movie_name,
       t.theatre_name
FROM bookings b
INNER JOIN movies m
ON b.movie_id = m.movie_id
INNER JOIN theatres t
ON b.theatre_id = t.theatre_id;


CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    branch VARCHAR(30)
);
CREATE TABLE companies (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(50),
    location VARCHAR(50)
);
CREATE TABLE placements (
    placement_id INT PRIMARY KEY,
    student_id INT,
    company_id INT,
    package_lpa DECIMAL(5,2),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);


INSERT INTO students VALUES
(101,'Vinay','CSE'),
(102,'Rahul','ECE'),
(103,'Priya','CSE'),
(104,'Sneha','EEE'),
(105,'Kiran','MECH');



INSERT INTO companies VALUES
(1,'TCS','Hyderabad'),
(2,'Infosys','Bangalore'),
(3,'Wipro','Pune'),
(4,'Accenture','Chennai');
INSERT INTO placements VALUES
(1001,101,1,6.50),
(1002,102,2,8.00),
(1003,103,4,10.50),
(1004,104,3,7.20);
select*from students;
select*from companies;
select*from placements;

select s.student_id,s.student_name from placements p inner join  students s on p.student_id=s.student_id ;
select s.student_name,c.company_name from students s inner join placements p on s.student_id=p.student_id inner join companies c on
c.company_id=p.company_id;
select students .student_name,placements.package_lpa from students inner join placements on students.student_id=placements.student_id;
select students.student_name,companies.company_id,companies.company_name from students inner join placements on students.student_id=placements.student_id
inner join companies on placements.company_id=companies.company_id ;



select students.student_name,companies.company_id,companies.company_name ,placements.package_lpa from students inner join placements on students.student_id=placements.student_id
inner join companies on placements.company_id=companies.company_id where company_name = 'tcs';


SELECT
   placements. placement_id,
    placements. student_id,
    placements.  company_id,
    placements. package_lpa,
    students.student_name
FROM placements
INNER JOIN students
ON placements.student_id = students.student_id;

SELECT
    students.student_name,
    students.branch,
    companies.company_name
FROM students
INNER JOIN placements
ON students.student_id = placements.student_id
INNER JOIN companies
ON placements.company_id = companies.company_id;



SELECT
    s.student_id,
    s.student_name
FROM students s
INNER JOIN placements p
ON s.student_id = p.student_id;

SELECT
    s.student_id,
    s.student_name,
    p.package_lpa
FROM students s
INNER JOIN placements p
ON s.student_id = p.student_id
WHERE p.package_lpa > 6;


SELECT
    s.student_id,
    s.student_name,
    s.branch,
    c.location
FROM students s
INNER JOIN placements p
ON s.student_id = p.student_id
INNER JOIN companies c
ON p.company_id = c.company_id;


SELECT
    s.student_id,
    s.student_name,
    s.branch
FROM students s
INNER JOIN placements p
ON s.student_id = p.student_id;

SELECT
    s.student_id,
    s.student_name,
    s.branch,
    c.company_name,
    c.location,
    p.package_lpa
FROM students s
INNER JOIN placements p
ON s.student_id = p.student_id
INNER JOIN companies c
ON p.company_id = c.company_id;



SELECT
    s.student_id,
    s.student_name,
    s.branch,
    p.placement_id,
    c.company_name,
    p.package_lpa
FROM students s
INNER JOIN placements p
ON s.student_id = p.student_id
INNER JOIN companies c
ON p.company_id = c.company_id;


SELECT
    s.student_id,
    s.student_name,
    s.branch,
    c.company_name,
    c.location,
    p.package_lpa
FROM students s
INNER JOIN placements p
ON s.student_id = p.student_id
INNER JOIN companies c
ON p.company_id = c.company_id;



SELECT
    s.student_name,
    s.branch,
    c.company_name,
    p.package_lpa
FROM students s
INNER JOIN placements p
ON s.student_id = p.student_id
INNER JOIN companies c
ON p.company_id = c.company_id;


SELECT
    s.student_name,
    s.branch,
    c.company_name,
    c.location,
    p.package_lpa
FROM students s
INNER JOIN placements p
ON s.student_id = p.student_id
INNER JOIN companies c
ON p.company_id = c.company_id
WHERE c.location = 'Hyderabad'
AND p.package_lpa > 6;






































