-- Step 1: Create departments table first
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

-- Step 2: Create employees table with foreign key reference
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    age INT,
    email VARCHAR(100),
    department_id INT,
    salary DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (department_id) REFERENCES departments(department_id) ON DELETE CASCADE
);


-- Insert departments first
INSERT INTO departments (department_id, department_name) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Marketing'),
(5, 'Sales');

-- Insert employees
INSERT INTO employees (employee_id, employee_name, age, email, department_id, salary, status) VALUES
(1, 'John Smith', 30, 'john.smith@example.com', 3, 55000.00, 'Active'),
(2, 'Emily Johnson', 28, 'emily.johnson@example.com', 1, 52000.00, 'Active'),
(3, 'Michael Brown', 35, 'michael.brown@example.com', 3, 60000.00, 'Active'),
(4, 'Sophia Davis', 26, 'sophia.davis@example.com', 4, 48000.00, 'Active'),
(5, 'Daniel Wilson', 40, 'daniel.wilson@example.com', 2, 72000.00, 'Active'),
(6, 'Olivia Taylor', 29, 'olivia.taylor@example.com', 5, 51000.00, 'Active'),
(7, 'James Anderson', 33, 'james.anderson@example.com', 3, 58000.00, 'Inactive'),
(8, 'Ava Thomas', 27, 'ava.thomas@example.com', 1, 49500.00, 'Active'),
(9, 'William Moore', 45, 'william.moore@example.com', 2, 75000.00, 'Active'),
(10, 'Isabella Martin', 31, 'isabella.martin@example.com', 4, 56000.00, 'Active'),
(11, 'Benjamin Jackson', 36, 'benjamin.jackson@example.com', 3, 63000.00, 'Active'),
(12, 'Mia White', 25, 'mia.white@example.com', 5, 47000.00, 'Inactive'),
(13, 'Lucas Harris', 38, 'lucas.harris@example.com', 2, 61000.00, 'Active'),
(14, 'Charlotte Clark', 29, 'charlotte.clark@example.com', 1, 52000.00, 'Active'),
(15, 'Henry Lewis', 41, 'henry.lewis@example.com', 2, 69000.00, 'Active'),
(16, 'Amelia Walker', 30, 'amelia.walker@example.com', 5, 54000.00, 'Inactive'),
(17, 'Elijah Hall', 34, 'elijah.hall@example.com', 3, 59000.00, 'Active'),
(18, 'Harper Allen', 28, 'harper.allen@example.com', 4, 50000.00, 'Active'),
(19, 'Alexander Young', 39, 'alexander.young@example.com', 2, 71000.00, 'Active'),
(20, 'Evelyn Hernandez', 27, 'evelyn.hernandez@example.com', 1, 48000.00, 'Active');


SELECT *from employees;

SELECT *from departments;


SELECT *from employees WHERE salary>60000;

SELECT * 
FROM employees
LIMIT 2 OFFSET 2;


SELECT avg(age) from employees;

SELECT employee_name, email
FROM employees
WHERE email LIKE '%example.com%'
   OR email LIKE '%example.net%'
   OR email LIKE '%google.com%';


SELECT e.employee_name FROM employees e
JOIN departments d
ON e.department_id= d.department_id
WHERE d.department_name='Engineering';


UPDATE employees
SET status = 'Inactive'
where employee_id =(
    SELECT employee_id FROM employees ORDER BY salary DESC LIMIT 1
);


SELECT d.department_name, AVG(e.salary)  AS average_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name;