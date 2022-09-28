-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_15
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `basket`
--

DROP TABLE IF EXISTS `basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Ссылка на товар',
  `quantity` int(10) unsigned DEFAULT NULL COMMENT 'Количество',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `basket_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `basket_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Корзина';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket`
--

LOCK TABLES `basket` WRITE;
/*!40000 ALTER TABLE `basket` DISABLE KEYS */;
INSERT INTO `basket` VALUES (1,1,1,5,'2022-07-19 01:55:10','2021-11-04 03:31:42'),(2,2,2,3,'2022-05-18 19:21:15','2021-11-22 17:16:22'),(3,3,3,9,'2022-06-16 12:02:40','2022-06-08 07:55:20'),(4,4,4,8,'2022-03-23 00:09:47','2022-01-31 09:39:14'),(5,5,5,7,'2022-01-30 22:49:26','2021-11-04 13:05:04'),(6,6,6,7,'2022-08-17 13:07:41','2022-06-29 14:04:45'),(7,7,7,9,'2022-08-16 08:21:55','2022-02-09 14:36:12'),(8,8,8,5,'2022-08-03 15:00:40','2021-10-27 12:30:42'),(9,9,9,6,'2022-07-27 18:26:21','2022-02-22 03:09:51'),(10,10,10,9,'2022-03-15 04:24:46','2021-11-24 02:21:33');
/*!40000 ALTER TABLE `basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogs`
--

DROP TABLE IF EXISTS `catalogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название раздела',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Разделы интернет-магазина';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogs`
--

LOCK TABLES `catalogs` WRITE;
/*!40000 ALTER TABLE `catalogs` DISABLE KEYS */;
INSERT INTO `catalogs` VALUES (3,'бестселлеры'),(1,'классика'),(4,'новинки литературы'),(2,'скоро в продаже');
/*!40000 ALTER TABLE `catalogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_option`
--

DROP TABLE IF EXISTS `delivery_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_option` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название способа доставки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Способы доставки';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_option`
--

LOCK TABLES `delivery_option` WRITE;
/*!40000 ALTER TABLE `delivery_option` DISABLE KEYS */;
INSERT INTO `delivery_option` VALUES (1,'курьерская доставка'),(2,'отправка почтой'),(3,'самовывоз');
/*!40000 ALTER TABLE `delivery_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `discount` float unsigned DEFAULT NULL COMMENT 'Величина скидки от 0.0 до 1.0',
  `started_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `discounts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `discounts_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Скидки';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES (1,1,1,1,'2022-03-14 17:06:02','2022-08-23 06:18:15','2015-01-31 14:40:57','0000-00-00 00:00:00'),(2,2,2,1,'2022-01-23 19:33:05','2022-09-09 14:40:45','2019-03-25 15:13:32','0000-00-00 00:00:00'),(3,3,3,1,'2022-07-14 03:04:16','2022-08-23 22:12:10','2021-06-04 13:50:15','0000-00-00 00:00:00'),(4,4,4,1,'2022-05-12 18:52:34','2022-08-18 22:45:06','2019-07-06 20:47:34','0000-00-00 00:00:00'),(5,5,5,0,'2022-05-23 11:28:28','2022-08-19 06:54:36','2018-06-02 22:32:36','0000-00-00 00:00:00'),(6,6,6,0,'2022-04-03 14:46:19','2022-09-01 09:29:45','2014-03-10 05:15:50','0000-00-00 00:00:00'),(7,7,7,1,'2022-01-24 16:26:02','2022-09-10 16:56:46','2013-09-30 06:36:10','0000-00-00 00:00:00'),(8,8,8,1,'2022-02-14 06:46:12','2022-08-20 03:07:29','2019-04-29 22:31:13','0000-00-00 00:00:00'),(9,9,9,0,'2022-07-05 02:42:19','2022-09-04 12:45:04','2021-04-10 22:49:26','0000-00-00 00:00:00'),(10,10,10,1,'2022-09-02 05:48:31','2022-09-03 16:32:16','2022-02-12 01:01:16','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_status_id` bigint(20) unsigned DEFAULT NULL,
  `delivery_option_id` bigint(20) unsigned DEFAULT NULL,
  `status` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Вариации статуса',
  PRIMARY KEY (`id`),
  KEY `order_status_id` (`order_status_id`),
  KEY `delivery_option_id` (`delivery_option_id`),
  CONSTRAINT `order_status_ibfk_1` FOREIGN KEY (`order_status_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_status_ibfk_2` FOREIGN KEY (`delivery_option_id`) REFERENCES `delivery_option` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Статус заказа';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (1,1,1,'ожидает получения'),(2,2,2,'принято в работу'),(3,3,3,'передано в доставку'),(4,4,1,'получено'),(5,5,2,'создано');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Заказы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2020-02-04 05:10:36','2022-05-10 22:37:02'),(2,2,'2017-04-14 17:04:05','2022-03-06 13:01:36'),(3,3,'2018-05-18 23:48:25','2021-11-12 03:14:00'),(4,4,'2020-11-26 00:26:36','2021-10-31 16:52:35'),(5,5,'2013-02-27 11:35:58','2021-11-23 13:16:45'),(6,6,'2022-09-04 01:59:59','2022-01-05 09:19:04'),(7,7,'2017-05-15 08:09:22','2022-08-30 15:28:07'),(8,8,'2019-10-14 03:52:45','2021-12-21 00:01:07'),(9,9,'2017-05-16 03:27:34','2022-04-29 17:28:28'),(10,10,'2020-03-03 03:01:01','2022-08-12 08:28:24');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название',
  `desription` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Описание',
  `price` decimal(11,2) DEFAULT NULL COMMENT 'Цена',
  `catalog_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `catalog_id` (`catalog_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`catalog_id`) REFERENCES `catalogs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Товарные позиции';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Мартин Иден',NULL,3974.00,1,'2013-07-19 03:04:25','2020-01-22 16:28:55'),(2,'Нефритовые четки',NULL,931.00,2,'1982-11-12 18:07:11','2021-04-08 05:30:30'),(3,'Азазель',NULL,157.00,3,'2017-05-26 02:31:17','2019-04-30 02:51:02'),(4,'Мастер и Маргарита',NULL,3815.00,4,'1990-10-21 20:32:58','2013-12-23 09:18:55'),(5,'Тревожные люди',NULL,646.00,1,'1987-05-10 17:44:35','2020-08-19 23:16:59'),(6,'Война и мир',NULL,2489.00,2,'1985-12-09 09:44:38','2016-04-10 00:05:34'),(7,'Песнь льда и пламени',NULL,2185.00,3,'2015-05-03 02:39:14','2014-04-19 07:29:50'),(8,'Полночная библиотека',NULL,4948.00,4,'1979-05-13 02:08:01','2018-02-07 04:08:09'),(9,'В погоне за счастьем',NULL,2640.00,1,'2005-09-04 18:26:51','2022-03-25 13:44:40'),(10,'Алмазная колесница',NULL,3218.00,2,'2009-06-07 18:14:44','2020-03-25 18:03:50');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Имя пользователя оставившего отзыв',
  `review_product_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Ссылка на товар',
  `text_review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Текст отзыва',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `review_product_id` (`review_product_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`review_product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Отзывы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,'alaina97',1,'книга понравилась','2022-01-29 11:53:57','2022-09-01 23:33:40'),(2,'justen.jacobson',2,'рекомендую','2022-07-25 13:27:35','2022-09-07 15:21:17'),(3,'elyse.hermiston',3,'не рекомендую','2022-02-10 02:15:32','2022-09-07 19:15:28'),(4,'roy.farrell',4,'любимая книга','2022-07-01 18:45:01','2022-08-23 20:21:44'),(5,'farrell.justen',5,'перечитываю не в первый раз','2021-11-11 02:26:38','2022-09-02 04:24:41'),(6,'nelson.mosciski',6,'не рекомендую','2022-03-21 09:05:42','2022-09-06 19:57:39'),(7,'maggio.sabina',7,'перечитываю не в первый раз','2022-03-17 11:58:56','2022-09-12 19:12:53'),(8,'nitzsche.michel',8,'рекомендую','2021-11-28 04:40:22','2022-09-14 07:48:52'),(9,'arnaldo14',9,'рекомендую','2022-09-02 23:09:49','2022-08-31 11:12:06'),(10,'llewellyn.hirthe',10,'рекомендую','2021-11-21 01:07:40','2022-09-13 21:54:24');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storehouses`
--

DROP TABLE IF EXISTS `storehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storehouses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Название склада',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Склады';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouses`
--

LOCK TABLES `storehouses` WRITE;
/*!40000 ALTER TABLE `storehouses` DISABLE KEYS */;
INSERT INTO `storehouses` VALUES (1,'Северный','2014-04-14 18:26:34','2022-07-08 21:41:27'),(2,'Западный','2014-12-23 08:51:50','2022-09-03 05:28:40'),(3,'Восточный','2016-04-18 23:22:22','2022-01-10 23:10:48'),(4,'Южный','2017-04-01 12:04:27','2022-02-15 21:21:09');
/*!40000 ALTER TABLE `storehouses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storehouses_products`
--

DROP TABLE IF EXISTS `storehouses_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storehouses_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `storehouse_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `value` int(10) unsigned DEFAULT NULL COMMENT 'Запас товарной позиции на складе',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `storehouse_id` (`storehouse_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `storehouses_products_ibfk_1` FOREIGN KEY (`storehouse_id`) REFERENCES `storehouses` (`id`),
  CONSTRAINT `storehouses_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Запасы на складе';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storehouses_products`
--

LOCK TABLES `storehouses_products` WRITE;
/*!40000 ALTER TABLE `storehouses_products` DISABLE KEYS */;
INSERT INTO `storehouses_products` VALUES (1,1,1,1,'2021-04-17 04:46:32','2022-08-06 15:34:09'),(2,2,2,2,'2021-09-28 21:42:47','2022-05-08 01:12:18'),(3,3,3,7,'2013-06-04 17:14:34','2022-01-10 13:46:23'),(4,4,4,5,'2018-01-06 01:45:40','2022-03-20 03:33:58'),(5,1,5,4,'2022-01-03 16:26:10','2021-09-20 14:00:23'),(6,2,6,4,'2019-05-20 15:04:40','2021-10-31 12:21:00'),(7,3,7,9,'2021-10-31 02:30:10','2022-05-16 11:17:54'),(8,4,8,8,'2016-06-17 09:06:34','2022-04-14 13:08:33'),(9,1,9,3,'2016-01-22 06:06:41','2021-11-19 14:44:54'),(10,2,10,6,'2015-05-20 23:19:13','2022-05-29 01:19:12');
/*!40000 ALTER TABLE `storehouses_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structure_of_orders`
--

DROP TABLE IF EXISTS `structure_of_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structure_of_orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `total` bigint(20) unsigned DEFAULT 1 COMMENT 'Количество заказанных товарных позиций',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `structure_of_orders_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `structure_of_orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Состав заказа';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structure_of_orders`
--

LOCK TABLES `structure_of_orders` WRITE;
/*!40000 ALTER TABLE `structure_of_orders` DISABLE KEYS */;
INSERT INTO `structure_of_orders` VALUES (1,1,1,10,'2022-02-14 14:07:20','2022-08-21 20:11:27'),(2,2,2,4,'2022-03-21 22:39:22','2022-09-09 17:15:36'),(3,3,3,5,'2021-09-29 12:41:19','2022-08-29 13:02:49'),(4,4,4,9,'2022-07-18 20:02:37','2022-09-02 18:50:23'),(5,5,5,3,'2022-05-30 12:51:49','2022-08-19 17:28:50'),(6,6,6,5,'2022-01-24 07:20:40','2022-09-09 15:55:43'),(7,7,7,10,'2021-12-11 12:38:57','2022-09-08 22:53:21'),(8,8,8,10,'2021-09-27 07:50:10','2022-08-23 13:00:45'),(9,9,9,2,'2022-08-13 19:09:29','2022-09-02 02:53:56'),(10,10,10,1,'2022-08-22 08:46:33','2022-08-27 01:50:28');
/*!40000 ALTER TABLE `structure_of_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` bigint(20) unsigned DEFAULT NULL,
  `password_hash` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Пользователи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Easton','Conroy','1999-05-15 22:24:23','cfadel@example.com',89739390471,'65971397beb91b9cc929c8bd088759e5db96f41e','2009-07-08 18:05:07','2021-11-09 07:18:45'),(2,'Randi','Bosco','1970-08-29 05:35:20','rashawn97@example.net',89764154901,'f8c0403452defebde41b512d6062f885fdcc31e2','1995-04-02 12:45:18','2022-04-06 03:02:15'),(3,'Ed','Bernhard','2010-06-19 11:45:26','tmoen@example.net',89110452897,'4a3354e88acea2ba24d51bf8b4c2656b7a7e7ef4','2022-03-11 07:19:50','2022-06-29 09:06:32'),(4,'Gavin','Williamson','1991-10-30 04:12:14','aolson@example.com',89160105281,'b2b92c52c82aa649d20493cb6f0796351b0500fb','1991-12-30 14:18:51','2021-12-30 18:18:36'),(5,'Caesar','Dickens','2015-12-13 06:45:29','ottis73@example.org',89802510053,'5cdfecd749bf8fd68ec91c4080f560a77ea1615f','1941-10-08 11:56:53','2021-10-18 13:31:39'),(6,'Durward','Bashirian','1974-04-15 10:27:42','ucrist@example.net',89295304710,'248536e88dd22b0e168e126466a0ca72595ad43e','1971-07-31 00:42:26','2022-03-02 07:09:32'),(7,'Jasen','Lesch','1983-04-23 12:38:19','aufderhar.wilber@example.org',89564698388,'2d9a726ce04b6dbeb15d33056a62bad75f009a51','2020-02-06 00:04:18','2022-09-14 23:45:58'),(8,'Leila','Hudson','1994-01-23 04:35:09','gharris@example.com',89580685724,'ea2ae2661f9fda1eb8184bf80ec244f7ff1068a1','1968-12-11 05:08:39','2022-08-28 07:24:34'),(9,'Edison','Jast','2008-06-14 19:39:56','shane.wilkinson@example.com',89024372147,'3b568112d8530f51b42fbe76c0cf979d71ad6fe5','1967-12-11 09:04:47','2021-11-25 08:41:46'),(10,'Liliane','Howell','1991-03-11 13:02:09','asa17@example.com',89217060465,'792420561ba2400f292124ee5a6ed3994cedcd23','1963-07-28 13:15:55','2021-12-15 05:25:27');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-16  9:39:38

