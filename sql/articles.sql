create schema schema_name_articles;
use schema_name_articles;
create table users
(
    id                bigint unsigned auto_increment,
    last_name         varchar(30)     not null,
    first_name        varchar(30)     not null,
    login             varchar(30)     not null,
    password          varchar(30)     not null,
    registration_date datetime        not null,
    role_id           bigint unsigned not null,
    primary key (id),
    foreign key (role_id) references roles (id)
);

create table roles
(
    id           bigint unsigned auto_increment,
    role         varchar(30) not null,
    display_name varchar(30) not null,
    primary key (id)

);

create table categories
(
    id   bigint unsigned auto_increment,
    name varchar(30) not null,
    primary key (id)
);
create table articles
(
    id            bigint unsigned auto_increment,
    article_title varchar(30)     not null,
    content       varchar(50)     not null,
    category_id   bigint unsigned not null,
    user_id       bigint unsigned not null,
    date          datetime,
    published     boolean         not null default (false),
    primary key (id),
    foreign key (user_id) references users (id),
    foreign key (category_id) references categories (id)
);

create table comments
(
    id         bigint unsigned auto_increment,
    article_id bigint unsigned not null,
    user_id    bigint unsigned not null,
    content    text            not null,
    date       datetime        not null,
    primary key (id),
    foreign key (article_id) references articles (id),
    foreign key (user_id) references users (id)
);
alter table articles
    add column article_rate tinyint unsigned default '0';

alter table articles
    drop column article_rate;

create table rating
(
    id         bigint unsigned auto_increment,
    article_id bigint unsigned  not null,
    user_id    bigint unsigned  not null,
    rating     tinyint unsigned not null,
    foreign key (article_id) references articles (id),
    foreign key (user_id) references users (id),
    primary key (id)
);

insert into categories(id, name)
values (1, 'qwerty'),
       (2, 'ytrewq'),
       (3, 'qazwsx');
insert into roles(id, role, display_name)
values (1, 'admin', 'Администратор'),
       (2, 'moderator', 'Модератор'),
       (3, 'user', 'Пользователь');
insert into users(id, last_name, first_name, login, password, registration_date, role_id)
values (1, 'Меркушев', 'Феликс', 'fel', 123, '2014-06-03 23:55:00', 1),
       (2, 'Субботин', 'Степан', 'step', 123, '2011-01-03 23:55:00', 2);

insert into articles(id, article_title, content, category_id, user_id, date, published)
values (1, 'QWERTY', 'sdfmsadf', 1, 1, '2015-07-19 16:33:00', true),
       (2, 'ЙЦУКЕН', 'sdfmsadf', 2, 2, '2012-07-19 16:33:00', true),
       (3, 'qwerty', 'sdfmsadf', 3, 1, '2010-07-19 16:33:00', true);

insert into rating(id, article_id, user_id, rating)
values (1, 1, 1, 5),
       (2, 2, 1, 4),
       (3, 3, 2, 3);

select article_title, last_name, avg(rating)
from rating
         join users u on rating.user_id = u.id
         join articles a on u.id = a.id
group by article_id;

