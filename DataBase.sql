CREATE DATABASE alif_db;

CREATE TABLE employees
(
    id         SERIAL PRIMARY KEY,
    name       VARCHAR(50)    NOT NULL,
    department VARCHAR(50)    NOT NULL,
    salary     DECIMAL(10, 2) NOT NULL,
    age        INT            NOT NULL,
    position   VARCHAR(50)    NOT NULL
);


INSERT INTO employees (name, department, salary, age, position)
VALUES ('John Doe', 'Marketing', 50000.00, 35, 'Back-End'),
       ('Jane Smith', 'Marketing', 55000.00, 42, 'Designer'),
       ('Bob Johnson', 'IT', 60000.00, 28, 'Back-End'),
       ('Sara Lee', 'IT', 65000.00, 52, 'Front-End'),
       ('Mike Williams', 'HR', 45000.00, 31, 'Q&A'),
       ('Emily Davis', 'HR', 48000.00, 27, 'Q&A'),
       ('David Brown', 'Finance', 70000.00, 47, 'Back-End'),
       ('Samantha Wilson', 'Finance', 75000.00, 55, 'Back-End'),
       ('Tom Garcia', 'Marketing', 52000.00, 29, 'Back-End'),
       ('Olivia Hernandez', 'IT', 62000.00, 38, 'Front-End');


-- Задача 1
SELECT name, age
FROM employees e
WHERE age > (SELECT AVG(age)
             FROM employees
             WHERE department = e.department);

-- Задача 2
SELECT name, department, salary
FROM employees
WHERE department = (SELECT department
                    FROM employees
                    WHERE salary = (SELECT MAX(salary) FROM employees));

-- Задача 3
SELECT name, department, salary
FROM employees e
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE department = e.department
);
