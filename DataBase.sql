CREATE
DATABASE alif_db;
CREATE TABLE books
(
    id             INT PRIMARY KEY,
    title          VARCHAR(255)  NOT NULL,
    author         VARCHAR(255)  NOT NULL,
    publisher_id   INT           NOT NULL,
    price          DECIMAL(5, 2) NOT NULL,
    published_date DATE          NOT NULL
);


INSERT INTO books (id, title, author, publisher_id, price, published_date)
VALUES (1, 'The Mysterious Affair at Styles', 'Agatha Christie', 1, 12.99, '1920-10-01'),
       (2, 'The Hound of the Baskervilles', 'Arthur Conan Doyle', 1, 15.50, '1902-04-15'),
       (3, 'Murder on the Orient Express', 'Agatha Christie', 1, 11.75, '1934-01-01'),
       (4, 'The Da Vinci Code', 'Dan Brown', 2, 18.99, '2003-03-18'),
       (5, 'The Girl on the Train', 'Paula Hawkins', 3, 9.99, '2015-01-13'),
       (6, 'Gone Girl', 'Gillian Flynn', 3, 14.75, '2012-06-05'),
       (7, 'The Shining', 'Stephen King', 2, 16.99, '1977-01-28'),
       (8, 'The Silence of the Lambs', 'Thomas Harris', 1, 13.50, '1988-07-06'),
       (9, 'The Kite Runner', 'Khaled Hosseini', 3, 10.25, '2003-05-29'),
       (10, 'The Book Thief', 'Markus Zusak', 2, 12.75, '2005-09-14');

SELECT DISTINCT author
FROM books
WHERE publisher_id > 3;

SELECT title, author, price
FROM books
ORDER BY price LIMIT 3;

SELECT title, author, published_date
FROM books
ORDER BY published_date LIMIT 3
OFFSET 2;

SELECT title, author, price, published_date
FROM books
WHERE published_date BETWEEN '2021-01-01' AND '2022-12-31'
  AND price > 20.00;

SELECT title, author, price, published_date
FROM books
WHERE author LIKE '%J%';



-- _____________________________________________________________________________________
-- HW 21


-- Создание таблицы employees
CREATE TABLE employees
(
    id         SERIAL PRIMARY KEY,
    name       VARCHAR(50)    NOT NULL,
    department VARCHAR(50)    NOT NULL,
    salary     DECIMAL(10, 2) NOT NULL,
    age        INT            NOT NULL
);



INSERT INTO employees (name, department, salary, age)
VALUES ('John Doe', 'Marketing', 50000.00, 35),
       ('Jane Smith', 'Marketing', 55000.00, 42),
       ('Bob Johnson', 'IT', 60000.00, 28),
       ('Sara Lee', 'IT', 65000.00, 52),
       ('Mike Williams', 'HR', 45000.00, 31),
       ('Emily Davis', 'HR', 48000.00, 27),
       ('David Brown', 'Finance', 70000.00, 47),
       ('Samantha Wilson', 'Finance', 75000.00, 55),
       ('Tom Garcia', 'Marketing', 52000.00, 29),
       ('Olivia Hernandez', 'IT', 62000.00, 38);

SELECT (SELECT COUNT(*) FROM employees)                     AS total_employees,
       (SELECT AVG(age) FROM employees)                     AS average_age,
       (SELECT MAX(salary) FROM employees)                  AS max_salary,
       (SELECT MIN(salary) FROM employees)                  AS min_salary,
       (SELECT SUM(salary) FROM employees)                  AS total_salaries,
       (SELECT COUNT(*) FROM employees WHERE age > 45)      AS employees_over_45,
       (SELECT COUNT(*)
        FROM employees
        WHERE salary > (SELECT AVG(salary) FROM employees)) AS employees_above_average_salary;


-- 2 Задачка
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;






