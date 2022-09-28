 -- Представления 

 -- Топ самых популярных книг месяца
  
CREATE OR REPLACE VIEW popular_books AS SELECT pr.name, au.name AS 'author', str.total AS 'quantity', MONTH(str.updated_at) AS 'month'
FROM structure_of_orders str 
JOIN products pr ON str.product_id = pr.id
JOIN authors au ON pr.author_id = au.id 
WHERE MONTH(str.updated_at) = MONTH(now())
ORDER BY MONTH(str.updated_at) DESC , total DESC;

 SELECT * FROM popular_books;

 -- Список товаров магазина отсортированных по категориям и названиям

CREATE OR REPLACE VIEW sorted_products AS SELECT name, catalog_id, price FROM products  ORDER BY catalog_id, name;

SELECT * FROM sorted_products;

 
 -- Процедура
 
 -- Проверка наличия на складе указанного товара (с указанием склада, на котором он хранится). 
 -- В качестве аргумента необходимо передать id товара.

DROP PROCEDURE IF EXISTS in_stock;

DELIMITER //
 
CREATE PROCEDURE in_stock (product_id INT)
BEGIN
	
SELECT p.name, sp.value, s.name AS 'storehouse'
FROM storehouses_products sp 
JOIN storehouses s ON sp.storehouse_id = s.id 
JOIN products p ON sp.product_id = p.id 
WHERE product_id = sp.product_id;

END //

DELIMITER ;

CALL in_stock (4);



