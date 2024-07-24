CREATE DATABASE new_db;
CREATE TABLE departments
(
    id              SERIAL PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    location        VARCHAR(50) NOT NULL
);

INSERT INTO departments (department_name, location)
VALUES ('Sales', 'New York'),
       ('Marketing', 'Seattle'),
       ('IT', 'New York'),
       ('HR', 'Chicago');

CREATE TABLE employees
(
    id            SERIAL PRIMARY KEY,
    name          VARCHAR(50)    NOT NULL,
    age           INTEGER        NOT NULL,
    department_id INTEGER,
    salary        DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments (id)
);

-- Заполнение таблицы employees
INSERT INTO employees (name, age, department_id, salary)
VALUES ('John Doe', 35, 1, 5000.00),
       ('Jane Smith', 42, 2, 6500.00),
       ('Bob Johnson', 28, 1, 4800.00),
       ('Sarah Lee', 31, 3, 5200.00),
       ('Tom Wilson', 39, 2, 5900.00),
       ('Emily Davis', 27, 3, 4600.00),
       ('Mike Brown', 45, NULL, 6000.00);

--Задача 1
SELECT e.name, d.department_name
FROM employees e
         INNER JOIN departments d ON e.department_id = d.id
WHERE d.location = 'New York';

--Задача 2
SELECT e.name AS entity, 'Employee' AS type
FROM employees e
UNION
SELECT d.department_name AS entity, 'Department' AS type
FROM departments d;

--Задача 3
SELECT e.name
FROM employees e
         INNER JOIN departments d ON e.department_id = d.id
WHERE d.location = 'New York'
INTERSECT
SELECT e.name
FROM employees e
         INNER JOIN departments d ON e.department_id = d.id
WHERE d.location = 'Seattle';

--Задача 4
SELECT e.name, d.department_name
FROM employees e
         LEFT JOIN departments d ON e.department_id = d.id
WHERE d.location IS NULL
   OR d.location != 'Seattle';
