create schema schema_cataloge;
use schema_cataloge;
create table categories
(
    id   bigint unsigned auto_increment,
    name varchar(30) not null,
    primary key (id)
);
create table features
(
    id              bigint unsigned auto_increment,
    category_id     bigint unsigned not null,
    category_option varchar(50)     not null,
    primary key (id),
    foreign key (category_id) references categories (id)
);

create table products
(
    id          bigint unsigned auto_increment,
    name        varchar(50)     not null,
    category_id bigint unsigned not null,
    price       bigint unsigned not null,
    primary key (id),
    foreign key (category_id) references categories (id)
);

create table option_value
(
    id         bigint unsigned auto_increment,
    product_id bigint unsigned not null,
    feature_id bigint unsigned not null,
    value      varchar(50)     not null,
    primary key (id),
    foreign key (product_id) references products (id),
    foreign key (feature_id) references features (id)
);

insert into categories
values (1, 'Мониторы'),
       (2, 'Телефоны');

insert into features(category_id, category_option)
values (1, 'Тип матрицы'),
       (1, 'Диагональ'),
       (1, 'Разрешение'),
       (1, 'Время отклика'),
       (1, 'Соотношение сторон'),
       (2, 'Размер экрана'),
       (2, 'Объем ОЗУ'),
       (2, 'Объем памяти'),
       (2, 'Разрешение камеры'),
       (2, 'Емкость аккумулятора');

insert into products(name, category_id, price)
values ('Монитор 21.5" HP M22f, Silver-Black', 1, 74900),
       ('Монитор 15.6" ASUS MB168B, Black-Gray', 1, 89900),
       ('Смартфон Xiaomi Redmi 9C', 2, 69900),
       ('Смартфон Apple iPhone 12', 2, 539900),
       ('Смартфон OnePlus Nord N100', 2, 65900);

insert into option_value(product_id, feature_id, value)
values (1, 1, 'IPS'),
       (1, 2, '21.5'),
       (1, 3, '1920x1080'),
       (1, 4, '1мс'),
       (1, 5, '16:9'),
       (4, 1, '6.1'),
       (4, 2, '4 GB'),
       (4, 3, '256 GB'),
       (4, 4, '12 Mp'),
       (4, 5, '2900 Mah');

select category_option
from products
         join categories c on products.category_id = c.id
         join features f on f.category_id = c.id
where products.id = 1




