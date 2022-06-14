-- Adminer 4.8.1 MySQL 5.7.33 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

CREATE DATABASE `eduwork-cruds` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `eduwork-cruds`;

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `image_url` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `products` (`id`, `user_id`, `name`, `price`, `stock`, `status`, `image_url`) VALUES
(1,	1,	'Laptop Asus',	18000000,	15,	1,	'http://localhost:3000/public/zenbook-pro-duo-15.jpg'),
(2,	1,	'Laptop HP',	20000000,	25,	0,	''),
(3,	2,	'Laptop Acer',	14000000,	13,	1,	''),
(4,	2,	'Laptop Lenovo',	10000000,	11,	1,	''),
(5,	0,	'Laptop Surface',	14000000,	2,	1,	'');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `alamat` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `users` (`id`, `nama`, `email`, `alamat`) VALUES
(1,	'Edi Hartono',	'edi.eduwork@gmail.com',	'Karangsono'),
(2,	'Rizal Aldo',	'aldosari@gmail.com',	'Kuripan');

-- 2022-06-14 08:04:30
