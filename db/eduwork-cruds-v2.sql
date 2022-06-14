-- Adminer 4.8.1 MySQL 5.7.33 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

CREATE DATABASE `eduwork-cruds-v2` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `eduwork-cruds-v2`;

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `image_url` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `products` (`id`, `user_id`, `name`, `price`, `stock`, `status`, `image_url`, `createdAt`, `updatedAt`) VALUES
(1,	1,	'Laptop Asus',	12000000,	10,	1,	'http://localhost:3000/public/zenbook-pro-duo-15.jpg',	'2022-06-12 08:43:47',	'2022-06-14 02:01:57'),
(4,	2,	'Laptop Acer',	30000000,	33,	0,	'http://localhost:3000/public/swift-x.jpg',	'2022-06-12 13:28:35',	'2022-06-12 13:28:35'),
(5,	2,	'Laptop Lenovo',	12000000,	9,	0,	'http://localhost:3000/public/ideapad-5.jpg',	'2022-06-12 13:55:58',	'2022-06-13 13:24:13');

-- 2022-06-14 08:06:13
