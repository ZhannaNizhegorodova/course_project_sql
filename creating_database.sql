/*Требования к курсовому проекту:
1. Составить общее текстовое описание БД и решаемых ею задач;
2. минимальное количество таблиц - 10;
3. скрипты создания структуры БД (с первичными ключами, индексами,
внешними ключами);
4. создать ERDiagram для БД;
5. скрипты наполнения БД данными;
6. скрипты характерных выборок (включающие группировки, JOIN'ы, вложенные
таблицы),представления (минимум 2);
7. хранимые процедуры / триггеры;
*/

/*
 База данных интернет-магазина Читай Город хранит информацию о каталоге магазина, 
 товарных позициях, авторах книг, скидках, складах и запасах на них. 
 
 В БД также организовано хранение информации о пользователях - покупателях интернет-магазина, 
 их корзине, структуре заказа и статусе заказа.
 
 В БД предусмотрена таблица, хранящая отзывы посетителей интернет-магазина.
 
 
 БД состоит из таблиц:
 
 1 - пользователи - users 
 2 - корзина - basket
 3 - разделы интернет-магазина - catalogs
 4 - товарные позиции - products
 5 - заказы - orders
 6 - состав заказа - structure_of_orders
 7 - скидки - discounts
 8 - склады - storehouses
 9 - запасы на складе - storehouses_products
 10 - способы доставки - delivery_option
 11 - статус заказа - order_status
 12 - отзывы - reviews
 13 - авторы - authors
 

*/

DROP DATABASE IF EXISTS readcity;
CREATE DATABASE readcity;
USE readcity;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    birthday DATETIME,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone BIGINT UNSIGNED UNIQUE,
 	password_hash VARCHAR(100),
 	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT 'Пользователи';

CREATE INDEX users_firstname_lastname_idx
ON users (firstname, lastname);

-- DROP INDEX index_name ON tbl_name;

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE COMMENT 'Название раздела'
) COMMENT = 'Разделы интернет-магазина';

DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY, -- SERIAL: BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
  name VARCHAR(255) COMMENT 'Название',
  desription TEXT COMMENT 'Описание',
  price DECIMAL (11,2) COMMENT 'Цена',
  catalog_id BIGINT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (catalog_id) REFERENCES catalogs(id)
) COMMENT = 'Товарные позиции';

DROP TABLE IF EXISTS basket;
CREATE TABLE basket (
  id SERIAL PRIMARY KEY,
  user_id BIGINT UNSIGNED,
  product_id BIGINT UNSIGNED COMMENT 'Ссылка на товар',
  quantity INT UNSIGNED COMMENT 'Количество',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
  )COMMENT 'Корзина';

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id BIGINT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT = 'Заказы';

DROP TABLE IF EXISTS structure_of_orders;
CREATE TABLE structure_of_orders (
  id SERIAL PRIMARY KEY,
  order_id BIGINT UNSIGNED,
  product_id BIGINT UNSIGNED,
  total BIGINT UNSIGNED DEFAULT 1 COMMENT 'Количество заказанных товарных позиций',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
) COMMENT = 'Состав заказа';

DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts (
  id SERIAL PRIMARY KEY,
  user_id BIGINT UNSIGNED,
  product_id BIGINT UNSIGNED,
  discount FLOAT UNSIGNED COMMENT 'Величина скидки от 0.0 до 1.0',
  started_at DATETIME,
  finished_at DATETIME,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
) COMMENT = 'Скидки';

DROP TABLE IF EXISTS storehouses;
CREATE TABLE storehouses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название склада',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Склады';

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id BIGINT UNSIGNED,
  product_id BIGINT UNSIGNED,
  value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (storehouse_id) REFERENCES storehouses(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
) COMMENT = 'Запасы на складе';

DROP TABLE IF EXISTS delivery_option;
CREATE TABLE delivery_option (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE COMMENT 'Название способа доставки'
) COMMENT = 'Способы доставки';

DROP TABLE IF EXISTS order_status;
CREATE TABLE order_status (
  id SERIAL PRIMARY KEY,
  order_status_id BIGINT UNSIGNED,
  delivery_option_id BIGINT UNSIGNED,
  status CHAR(50) COMMENT 'Вариации статуса',
  FOREIGN KEY (order_status_id) REFERENCES orders(id),
  FOREIGN KEY (delivery_option_id) REFERENCES delivery_option(id)
  )COMMENT 'Статус заказа';

DROP TABLE IF EXISTS reviews;
CREATE TABLE reviews (
  id SERIAL PRIMARY KEY,
  user_name VARCHAR(255) COMMENT 'Имя пользователя оставившего отзыв',
  review_product_id BIGINT UNSIGNED COMMENT 'Ссылка на товар',
  text_review TEXT COMMENT 'Текст отзыва',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (review_product_id) REFERENCES products(id)
  ) COMMENT = 'Отзывы'; 

 
DROP TABLE IF EXISTS authors;
CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) UNIQUE COMMENT 'ФИО автора'
) COMMENT = 'Авторы';

INSERT INTO authors (name)
VALUES
('Джек Лондон'),
('Борис Акунин'),
('Михаил Афанасьевич Булгаков'),
('Фредрик Бакман'),
('Лев Николаевич Толстой'),
('Джордж Мартин'),
('Мэтт Хейг'),
('Крис Гарднер');

-- Добавим в таблицу products id автора (author_id) и свяжем таблицы products и authors (отношение один ко многим)

ALTER TABLE products ADD COLUMN author_id BIGINT UNSIGNED AFTER name;

ALTER TABLE products ADD CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES authors(id);




 
 
 
 
 
 
 


