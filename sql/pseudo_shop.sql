-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 15, 2021 at 10:30 AM
-- Server version: 8.0.15
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pseudo_shop`
--

DELIMITER $$
--
-- Functions
--
CREATE
    DEFINER = `root`@`%` FUNCTION `x`() RETURNS INT(11)

begin

    return 123;

end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories`
(
    `id`   bigint(20) UNSIGNED NOT NULL,
    `name` varchar(70)         NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`)
VALUES (3, 'Блоки питания'),
       (4, 'Видеокарты'),
       (5, 'Мониторы'),
       (2, 'Оперативная память'),
       (1, 'Процессоры');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders`
(
    `id`        bigint(20) UNSIGNED NOT NULL,
    `user_id`   bigint(20) UNSIGNED NOT NULL,
    `city`      varchar(50)         NOT NULL,
    `street`    varchar(50)         NOT NULL,
    `house`     varchar(20)         NOT NULL,
    `apartment` varchar(20)         NOT NULL,
    `created`   datetime DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `city`, `street`, `house`, `apartment`, `created`)
VALUES (1, 10, 'Плюсса', 'Есенинский Бульвар', '10', '168', '2019-07-21 15:15:15'),
       (2, 7, 'Бижбуляк', 'МКАД 49 км Дорога', '5', '180', '2019-07-15 19:23:23'),
       (3, 6, 'Плюсса', 'Есенинский Бульвар', '10', '168', '2019-07-15 19:23:23'),
       (4, 9, 'Владимир', 'Поварская', '89', '231', '2019-07-15 19:23:23'),
       (5, 7, 'Филипповка', 'Ямского Поля 5-я', '21', '150', '2019-07-15 19:23:23'),
       (6, 11, 'Семенов', 'Серегина', '72', '199', '2019-07-15 19:23:23'),
       (7, 6, 'Большое село', 'Радиальная', '47', '57', '2019-07-15 19:23:23'),
       (8, 11, 'Бижбуляк', 'МКАД 49 км Дорога', '5', '180', '2019-07-15 19:23:23'),
       (9, 5, 'Солнцево', 'Дубосековская', '38', '281', '2019-07-15 19:23:23'),
       (10, 4, 'Павлово', 'Путинковский М. Переулок', '52', '292', '2019-07-15 19:23:23'),
       (11, 9, 'Старица', 'Ивана Бабушкина', '90', '179', '2019-07-15 19:23:23'),
       (12, 10, 'Бижбуляк', 'МКАД 49 км Дорога', '5', '180', '2019-07-15 19:23:23'),
       (13, 8, 'Тамбов', 'Уссурийская', '84', '275', '2019-07-15 19:23:23'),
       (14, 7, 'Плюсса', 'Есенинский Бульвар', '10', '168', '2019-07-15 19:23:23'),
       (15, 8, 'Бижбуляк', 'МКАД 49 км Дорога', '5', '180', '2019-07-15 19:23:23');

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product`
(
    `order_id`   bigint(20) UNSIGNED NOT NULL,
    `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`order_id`, `product_id`)
VALUES (1, 3),
       (1, 7),
       (1, 23),
       (2, 1),
       (2, 13),
       (2, 22),
       (2, 19),
       (3, 17),
       (3, 18),
       (3, 5),
       (3, 7),
       (4, 6),
       (4, 1),
       (4, 12),
       (4, 14),
       (4, 16),
       (5, 4),
       (5, 4),
       (5, 6),
       (5, 6),
       (5, 18),
       (5, 18),
       (6, 18),
       (6, 11),
       (6, 16),
       (6, 17),
       (7, 8),
       (7, 8),
       (8, 10),
       (8, 21),
       (8, 23),
       (9, 1),
       (9, 2),
       (10, 5),
       (10, 14),
       (10, 15),
       (10, 9),
       (11, 13),
       (12, 22),
       (12, 17),
       (12, 6),
       (13, 7),
       (13, 6),
       (14, 19),
       (15, 11),
       (15, 7);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products`
(
    `id`          bigint(20) UNSIGNED NOT NULL,
    `category_id` bigint(20) UNSIGNED NOT NULL,
    `name`        varchar(90)         NOT NULL,
    `price`       decimal(8, 2)       NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `price`)
VALUES (1, 1, 'Процессор AMD Ryzen 5 3400G, AM4, BOX', '74900.00'),
       (2, 1, 'Процессор AMD Athlon 240GE, AM4, OEM', '23400.00'),
       (3, 1, 'Процессор AMD Ryzen 7 3700X, AM4, OEM', '159700.00'),
       (4, 1, 'Процессор AMD Ryzen 5 3600X, AM4, OEM', '115500.00'),
       (5, 1, 'Процессор AMD Ryzen 5 3600, AM4, OEM', '93900.00'),
       (6, 1, 'Процессор AMD Ryzen 5 3400G, AM4, OEM', '72200.00'),
       (7, 1, 'Процессор AMD Ryzen 5 3600X, AM4, BOX', '121100.00'),
       (8, 1, 'Процессор AMD Ryzen 5 2600X, AM4, BOX', '74700.00'),
       (9, 1, 'Процессор AMD Ryzen 7 2700X, AM4, BOX', '126800.00'),
       (10, 2, 'DDR-4 DIMM 4Gb/3200MHz PC25600 Kingston HyperX Fury, Black, BOX', '9870.00'),
       (11, 2, 'DDR-4 DIMM 16Gb/2400MHz PC19200 Kingston HyperX Predator, BOX', '38400.00'),
       (12, 2, 'DDR-4 DIMM 8Gb/3200MHz PC25600 Kingston HyperX Predator, BOX', '24900.00'),
       (13, 2, 'DDR-4 DIMM 8Gb/3600MHz PC28800 Kingston HyperX Predator, BOX', '38400.00'),
       (14, 2, 'DDR-4 DIMM 8Gb/3466MHz PC27700 Kingston HyperX Fury, Black, BOX', '22400.00'),
       (15, 2, 'DDR-4 DIMM 8Gb/3000MHz PC24000 Kingston HyperX Predator RGB, BOX', '24900.00'),
       (16, 2, 'DDR-4 DIMM 16Gb/3000MHz PC24000 Kingston HyperX Predator RGB, 2x8Gb Kit, BOX', '51600.00'),
       (17, 3, 'Блок питания ATX 600W Thermaltake Toughpower GX1', '42200.00'),
       (18, 3, 'Блок питания ATX 600W Thermaltake Toughpower GX1 RGB', '44900.00'),
       (19, 3, 'Блок питания ATX 650W Thermaltake Litepower RGB', '21500.00'),
       (20, 3, 'Блок питания ATX 550W Thermaltake Litepower RGB', '20500.00'),
       (21, 3, 'Блок питания ATX 750W Thermaltake Smart BX1 RGB', '39300.00'),
       (22, 3, 'Блок питания ATX 650W Thermaltake Smart BX1 RGB', '37500.00'),
       (23, 3, 'Блок питания ATX 550W Thermaltake Smart BX1 RGB', '34300.00');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles`
(
    `id`           bigint(20) UNSIGNED NOT NULL,
    `name`         varchar(50)         NOT NULL,
    `display_name` varchar(50) DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`)
VALUES (1, 'admin', 'Администратор'),
       (2, 'moderator', 'Модератор'),
       (3, 'user', 'Пользователь');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users`
(
    `id`         bigint(20) UNSIGNED NOT NULL,
    `role_id`    bigint(20) UNSIGNED NOT NULL,
    `surname`    varchar(50)         NOT NULL,
    `name`       varchar(50)         NOT NULL,
    `patronymic` varchar(50) DEFAULT NULL,
    `reg_date`   datetime            NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `surname`, `name`, `patronymic`, `reg_date`)
VALUES (1, 1, 'Меркушев', 'Феликс', 'Романович', '2014-06-03 23:55:00'),
       (2, 3, 'Субботин', 'Степан', 'Филатович', '2018-10-08 21:36:00'),
       (3, 3, 'Одинцов', 'Андрей', 'Пётрович', '2015-07-19 16:33:00'),
       (4, 2, 'Силин', 'Витольд', 'Феликсович', '2018-08-26 16:17:00'),
       (5, 3, 'Третьяков', 'Максимилиан', 'Аристархович', '2016-12-10 07:50:00'),
       (6, 3, 'Тарасов', 'Алан', 'Юлианович', '2017-01-01 06:55:00'),
       (7, 3, 'Ковалёв', 'Герасим', 'Еремеевич', '2015-07-02 16:58:00'),
       (8, 2, 'Потапов', 'Ипполит', 'Онисимович', '2015-11-09 11:44:00'),
       (9, 3, 'Ларионов', 'Леонтий', 'Вадимович', '2019-02-25 10:38:00'),
       (10, 3, 'Лебедев', 'Михаил', 'Юлианович', '2013-10-06 21:10:00'),
       (11, 3, 'Михайлов', 'Вилен', 'Иосифович', '2019-02-26 09:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
    ADD PRIMARY KEY (`id`),
    ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
    ADD PRIMARY KEY (`id`),
    ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
    ADD KEY `order_product_order_id_foreign` (`order_id`),
    ADD KEY `order_product_product_id_foreign` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
    ADD PRIMARY KEY (`id`),
    ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
    ADD PRIMARY KEY (`id`),
    ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
    ADD PRIMARY KEY (`id`),
    ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 24;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
    ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
    ADD CONSTRAINT `order_product_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
    ADD CONSTRAINT `order_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
    ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
    ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;


select display_name, count(c.id) count
from users
         join roles c on users.role_id = c.id
group by role_id;

select round(avg(price)) avg, c.name
from products
         join categories c on products.category_id = c.id
group by category_id
order by avg desc
limit 1;

select count(product_id) 'Количество', p.name
from order_product
         join products p on order_product.product_id = p.id
group by name
order by count(product_id) desc
limit 1;

select o.id,
       u.surname,
       u.name,
       o.city,
       o.street,
       sum(amount)                       'Количество',
       sum(price * order_product.amount) total
from order_product
         join orders o on order_product.order_id = o.id
         join users u on o.user_id = u.id
         join products p on order_product.product_id = p.id
         join discount d on p.category_id = d.id
group by order_id
order by count(order_id) desc;

alter table order_product
    add column amount tinyint unsigned default '1';

create table discount
(
    id          bigint unsigned auto_increment,
    category_id bigint(20) unsigned not null,
    discount    bigint(20) unsigned not null,
    primary key (id)
);
insert into discount(category_id, discount)
values (1, 0.10),
       (2, 0.15),
       (3, 0.20);

select name, price, round(price - (price * sum(discount) / 100)) 'цена со скидкой', sum(discount)
from products
         join discount d on products.category_id = d.category_id
group by products.id;

select display_name, u.surname
from roles
         join users u on roles.id = u.role_id;

select surname, city, display_name
from users
         join orders o on users.id = o.user_id
         join roles r on users.role_id = r.id;

select products.name, city
from products
         join order_product op on products.id = op.product_id
         join orders o on op.order_id = o.id









