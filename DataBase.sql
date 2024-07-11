CREATE DATABASE alif_db;
CREATE TABLE product
(
    model VARCHAR(50) PRIMARY KEY NOT NULL,
    maker VARCHAR(10)             NOT NULL,
    type  VARCHAR(50)             NOT NULL
);

INSERT INTO product (maker, model, type)
VALUES ('B', 1121, 'PC'),
       ('A', 1232, 'PC'),
       ('A', 1233, 'PC'),
       ('E', 1260, 'PC'),
       ('A', 1276, 'Printer'),
       ('D', 1288, 'Printer'),
       ('A', 1298, 'Laptop'),
       ('C', 1321, 'Laptop'),
       ('A', 1401, 'Printer'),
       ('A', 1408, 'Printer'),
       ('D', 1433, 'Printer'),
       ('E', 1434, 'Printer'),
       ('B', 1750, 'Laptop'),
       ('A', 1752, 'Laptop'),
       ('E', 2112, 'PC'),
       ('E', 2113, 'PC');

CREATE TABLE pc
(
    code  INT         NOT NULL PRIMARY KEY,
    model VARCHAR(50) NOT NULL,
    speed SMALLINT    NOT NULL,
    ram   SMALLINT    NOT NULL,
    hd    REAL        NOT NULL,
    cd    VARCHAR(10) NOT NULL,
    price DECIMAL(10, 2),
    FOREIGN KEY (model) REFERENCES product (model)
);

INSERT INTO pc (code, model, speed, ram, hd, cd, price)
VALUES (1, 1232, 500, 64, 5.0, '12x', 600.0000),
       (2, 1121, 750, 128, 14.0, '40x', 850.0000),
       (3, 1233, 500, 64, 5.0, '12x', 600.0000),
       (4, 1121, 600, 128, 14.0, '40x', 850.0000),
       (5, 1121, 600, 128, 8.0, '40x', 850.0000),
       (6, 1233, 750, 128, 20.0, '50x', 950.0000),
       (7, 1232, 500, 32, 10.0, '12x', 400.0000),
       (8, 1232, 450, 64, 8.0, '24x', 350.0000),
       (9, 1232, 450, 32, 10.0, '24x', 350.0000),
       (10, 1260, 500, 32, 10.0, '12x', 350.0000),
       (11, 1233, 900, 128, 40.0, '40x', 980.0000),
       (12, 1233, 800, 128, 20.0, '50x', 970.0000);

CREATE TABLE laptop
(
    code   INT         NOT NULL PRIMARY KEY,
    model  VARCHAR(50) NOT NULL,
    speed  SMALLINT    NOT NULL,
    ram    SMALLINT    NOT NULL,
    hd     REAL        NOT NULL,
    price  DECIMAL(10, 2),
    screen SMALLINT    NOT NULL,
    FOREIGN KEY (model) REFERENCES product (model)
);

INSERT INTO laptop (code, model, speed, ram, hd, price, screen)
VALUES (1, '1298', 350, 32, 4.0, 700.00, 11),
       (2, '1321', 500, 64, 8.0, 970.00, 12),
       (3, '1750', 750, 128, 12.0, 1200.00, 14),
       (4, '1298', 600, 64, 10.0, 1050.00, 15),
       (5, '1752', 750, 128, 10.0, 1150.00, 14),
       (6, '1298', 450, 64, 10.0, 950.00, 12);

CREATE TABLE printer
(
    code  INT NOT NULL PRIMARY KEY,
    model VARCHAR(50),
    color CHAR(1),
    type  VARCHAR(10),
    price DECIMAL(10, 2),
    FOREIGN KEY (model) REFERENCES product (model)
);

INSERT INTO printer (code, model, color, type, price)
VALUES (6, '1288', 'n', 'Laser', 400.00),
       (5, '1408', 'n', 'Matrix', 270.00),
       (4, '1401', 'n', 'Matrix', 150.00),
       (3, '1434', 'y', 'Jet', 290.00),
       (2, '1433', 'y', 'Jet', 270.00),
       (1, '1276', 'n', 'Laser', 400.00);



--________________________________________________________________________________________________________________

-- CREATE DATABASE alif_db;
-- CREATE TABLE orders (
--                         id            SERIAL PRIMARY KEY,
--                         customer_id   INTEGER,
--                         product_id    INTEGER NOT NULL,
--                         quantity      INTEGER,
--                         order_date    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );
--
-- SELECT * FROM orders;
--
-- INSERT INTO Orders (customer_id, product_id, quantity, order_date)
-- VALUES  (1, 101, 2, '2023-07-01 10:00:00'),
--         (2, 102, 1, '2023-07-02 11:30:00'),
--         (3, 103, 5, '2023-07-03 09:15:00'),
--         (1, 104, 3, '2023-07-04 14:20:00'),
--         (4, 105, 4, '2023-07-05 16:45:00');
--
-- SELECT *
-- FROM Orders
-- WHERE customer_id = 1;
--
-- UPDATE Orders
-- SET quantity = 2
-- WHERE id = 2;
--
-- SELECT quantity
-- FROM orders
-- WHERE id = 2;
--
-- DELETE
-- FROM orders
-- WHERE id = 3;
--
--
--
--
-- CREATE TABLE events(
--                        id SERIAL PRIMARY KEY,
--                        name VARCHAR(55) NOT NULL,
--                        event_date DATE DEFAULT CURRENT_TIMESTAMP,
--                        location VARCHAR(55),
--                        participant_count INTEGER
-- );
--
-- SELECT *
-- FROM events;
--
-- INSERT INTO Events (name, event_date, location, participant_count) VALUES
--     ('ESL One Cologne 2024', '2024-07-05 12:00:00', 'Cologne', 16000),
--     ('IEM Katowice 2024', '2024-02-28 14:00:00', 'Katowice', 10000),
--     ('PGL Major Stockholm 2024', '2024-10-26 15:00:00', 'Stockholm', 17000),
--     ('BLAST Premier Global Final 2024', '2024-12-14 16:00:00', 'Copenhagen', 8000),
--     ('DreamHack Masters Malmö 2024', '2024-09-30 11:00:00', 'Malmö', 12000),
--     ('IEM Cologne 2024', '2024-07-20 13:00:00', 'Cologne', 16000),
--     ('ESL Pro League Season 19', '2024-03-10 14:30:00', 'Dallas', 5000),
--     ('DreamHack Open Anaheim 2024', '2024-04-15 10:00:00', 'Anaheim', 6000),
--     ('BLAST Premier Spring Finals 2024', '2024-06-10 16:00:00', 'Lisbon', 7000),
--     ('IEM Sydney 2024', '2024-08-25 11:00:00', 'Sydney', 8000),
--     ('PGL Major Paris 2024', '2024-11-05 09:00:00', 'Paris', 15000),
--     ('ESL One New York 2024', '2024-09-10 13:00:00', 'New York', 10000),
--     ('DreamHack Masters Las Vegas 2024', '2024-12-05 10:00:00', 'Las Vegas', 11000),
--     ('IEM Beijing-Haidian 2024', '2024-10-15 09:30:00', 'Beijing', 9000),
--     ('CS:GO Asia Championships 2024', '2024-05-20 11:00:00', 'Shanghai', 7000),
--     ('ESL One Cologne 2025', '2025-07-05 12:00:00', 'Cologne', 16000),
--     ('IEM Katowice 2025', '2025-02-28 14:00:00', 'Katowice', 10000);
--
--
--
-- SELECT *
-- FROM events
-- WHERE location = 'Cologne';
--
-- SELECT *
-- FROM events;
--
-- UPDATE events
-- SET participant_count = participant_count + 4000
-- WHERE id = 23;
--
-- DELETE
-- FROM events
-- WHERE id = 29;
--
--
--
--
--
-- ----------------------------------------------------------------------------------------------------------------------
-- --
-- --
-- --
-- --
-- -- CREATE DATABASE alif_db;
-- --
-- -- CREATE TABLE inventory (
-- --                            id              SERIAL PRIMARY KEY ,
-- --                            product_name    VARCHAR(55),
-- --                            category        VARCHAR(55),
-- --                            quantity        INTEGER CHECK (quantity >= 0) DEFAULT 0,
-- --                            price           FLOAT,
-- --                            last_update     TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- -- );
-- --
-- -- INSERT INTO inventory (product_name, category, quantity, price)
-- -- VALUES
-- --     ('Говядина', 'Мясо-птица', 500, 86.0),
-- --     ('Картофель', 'Фрукты и овощи', 1780, 6.20),
-- --     ('Курица', 'Мясо-птица', 600, 45.0),
-- --     ('Яблоки', 'Фрукты и овощи', 1500, 15.0),
-- --     ('Молоко', 'Молочные продукты', 300, 7.5),
-- --     ('Хлеб', 'Выпечка', 200, 2.5),
-- --     ('Яйца', 'Молочные продукты', 1000, 1.2),
-- --     ('Морковь', 'Фрукты и овощи', 1200, 5.0),
-- --     ('Сыр', 'Молочные продукты', 250, 40.0),
-- --     ('Рыба', 'Мясо-птица', 400, 55.0),
-- --     ('Сахар', 'Бакалея', 700, 6.8),
-- --     ('Рис', 'Бакалея', 1000, 8.5);
-- --
-- -- SELECT product_name FROM inventory ;
-- --
-- -- SELECT * FROM inventory
-- -- WHERE category = 'Мясо-птица';
-- --
-- --
-- -- CREATE TABLE books(
-- --                       id SERIAL PRIMARY KEY ,
-- --                       title VARCHAR(55) NOT NULL,
-- --                       author VARCHAR(55) NOT NULL,
-- --                       publication_date DATE,
-- --                       genre VARCHAR(55),
-- --                       is_available BOOLEAN DEFAULT FALSE
-- -- );
-- --
-- -- INSERT INTO books (title, author, publication_date, genre, is_available)
-- -- VALUES
-- --     ('Шахнаме', 'Фирдоуси', '1010-01-01', 'Эпос', TRUE),
-- --     ('Гулистан', 'Саади', '1258-01-01', 'Поэзия', TRUE),
-- --     ('Бустан', 'Саади', '1257-01-01', 'Поэзия', TRUE),
-- --     ('Диуан Хафиза', 'Хафиз', '1390-01-01', 'Поэзия', TRUE),
-- --     ('Рубаи', 'Омар Хайям', '1120-01-01', 'Поэзия', TRUE),
-- --     ('Книга царей', 'Ахикар', '500-01-01', 'История', TRUE),
-- --     ('Трактаты', 'Авиценна', '1020-01-01', 'Философия', TRUE),
-- --     ('Чахар Мақола', 'Низами-Арузи', '1157-01-01', 'Поэзия', TRUE),
-- --     ('Зинда-руд', 'Джалал ад-Дин Руми', '1273-01-01', 'Поэзия', TRUE),
-- --     ('Мемориал', 'Низами Гянджеви', '1200-01-01', 'Поэзия', TRUE),
-- --     ('Семь планет', 'Низами Гянджеви', '1197-01-01', 'Поэзия', TRUE),
-- --     ('Сокровища королей', 'Низами Гянджеви', '1202-01-01', 'Поэзия', TRUE),
-- --     ('Диуан Рудаки', 'Рудаки', '940-01-01', 'Поэзия', TRUE),
-- --     ('Куллиёт', 'Айни', '1948-01-01', 'Проза', TRUE),
-- --     ('Ятим вака', 'Айни', '1934-01-01', 'Проза', TRUE);
-- --
-- --
-- -- SELECT title FROM books;
-- --
-- -- SELECT * FROM books
-- -- WHERE author = 'Айни';
-- --
-- -- SELECT * FROM books
-- -- WHERE genre = 'Поэзия';
-- --
-- -- SELECT * FROM books
-- -- WHERE is_available = TRUE;
-- --
-- -- CREATE TABLE students (
-- --                           id          SERIAL PRIMARY KEY,
-- --                           first_name  VARCHAR(255),
-- --                           last_name   VARCHAR(255),
-- --                           email       VARCHAR(255),
-- --                           course      INTEGER CHECK (course >= 1 AND course <= 6),
-- --                           grade       INTEGER CHECK (grade >= 0 AND grade <= 100)
-- -- );
-- --
-- -- INSERT INTO students (first_name, last_name, email, course, grade)
-- -- VALUES
-- --     ('Александр', 'Иванов', 'alex.ivanov@example.com', 1, 85),
-- --     ('Мария', 'Петрова', 'maria.petrova@example.com', 2, 90),
-- --     ('Дмитрий', 'Смирнов', 'dmitri.smirnov@example.com', 3, 78),
-- --     ('Ольга', 'Кузнецова', 'olga.kuznetsova@example.com', 4, 92),
-- --     ('Иван', 'Попов', 'ivan.popov@example.com', 5, 88),
-- --     ('Анна', 'Соколов', 'anna.sokolov@example.com', 6, 95),
-- --     ('Петр', 'Лебедев', 'petr.lebedev@example.com', 2, 76),
-- --     ('Елена', 'Козлов', 'elena.kozlov@example.com', 3, 82),
-- --     ('Сергей', 'Новиков', 'sergey.novikov@example.com', 1, 89),
-- --     ('Наталья', 'Морозов', 'natalya.morozov@example.com', 4, 91);
-- --
-- -- SELECT first_name, last_name FROM students;
-- --
-- -- SELECT * FROM students
-- -- WHERE course = 2;
-- --
-- -- SELECT * FROM students
-- -- WHERE grade >= 90;