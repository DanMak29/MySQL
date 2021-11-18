create schema j1630_daniyar_second_schema;
use j1630_daniyar_second_schema;
create table cities
(
    id   bigint unsigned auto_increment,
    city varchar(30) not null,
    primary key (id)
);
alter table users
    add column city_id bigint unsigned after id;

select *
from users;
insert into cities (city)
values ('Москва'),
       ('Алматы'),
       ('Киев'),
       ('Минск'),
       ('Нур-Султан'),
       ('Краснодар');
select*
from cities;
update users
set city_id = 3
where id = 14;
alter table users drop column city;
alter table users add foreign key (city_id) references cities(id);
select first_name, birthdate, city
from users
join cities c on users.city_id = c.id;






