-- 1. One to One:
--
-- Таблица "Автомобили":
-- - ID (ключ)
-- - Марка
-- - Модель
-- - ВладелецID (ключ)
--
-- Таблица "Номерные знаки":
-- - ID (ключ)
-- - Номер
-- - АвтомобильID (ключ)
--
-- Связь: Каждому автомобилю присваивается только один номерной знак, каждый номерной знак принадлежит только одному автомобилю.
--
-- 2. One to Many:
--
-- Таблица "Отделы":
-- - ID (ключ)
-- - Название
--
-- Таблица "Сотрудники":
-- - ID (ключ)
-- - Имя
-- - ОтделID (ключ)
--
-- Связь: Один отдел может иметь несколько сотрудников, но каждый сотрудник принадлежит только одному отделу.
--
-- 3. Many to Many:
--
-- Таблица "Фильмы":
-- - ID (ключ)
-- - Название
--
-- Таблица "Актеры":
-- - ID (ключ)
-- - Имя
-- - Фамилия
--
-- Таблица "Роли":
-- - ID (ключ)
-- - ФильмID (ключ)
-- - АктерID (ключ)
--
-- Связь: Один фильм может иметь несколько актеров, и один актер может сниматься в нескольких фильмах.

-- One To One
CREATE TABLE Cars
(
    car_id   SERIAL PRIMARY KEY,
    brand   VARCHAR(50),
    model   VARCHAR(50),
    owner_id INT,
    FOREIGN KEY (owner_id) REFERENCES Owners (owner_id)
);

CREATE TABLE Owners
(
    owner_id     SERIAL PRIMARY KEY,
    name         VARCHAR(50),
    address      VARCHAR(100),
    phone_number VARCHAR(15),
    car_id       INT,
    FOREIGN KEY (car_id) REFERENCES Cars (car_id)
);


CREATE TABLE license_plates
(
    plate_id     SERIAL PRIMARY KEY,
    plate_number VARCHAR(20),
    car_id       INT,
    FOREIGN KEY (car_id) REFERENCES Cars (car_id)
);

-- One to Many
CREATE TABLE Departments
(
    dept_id   SERIAL PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE Employees
(
    emp_id   SERIAL PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id  INT,
    FOREIGN KEY (dept_id) REFERENCES Departments (dept_id)
);

-- Many to Many
CREATE TABLE Movies
(
    movie_id SERIAL PRIMARY KEY,
    title   VARCHAR(100)
);

CREATE TABLE Actors
(
    actor_id   SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name  VARCHAR(50)
);

CREATE TABLE Roles
(
    role_id  SERIAL PRIMARY KEY,
    movie_id INT,
    actor_id INT,
    FOREIGN KEY (movie_id) REFERENCES Movies (movie_id),
    FOREIGN KEY (actor_id) REFERENCES Actors (actor_id)
);