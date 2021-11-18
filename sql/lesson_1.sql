create schema j1630_daniyar_first_schema;
use j1630_daniyar_first_schema;
create table users
(
    id           bigint unsigned auto_increment,
    first_name   varchar(30)                       not null,
    last_name    varchar(30)                       not null,
    birthdate    date                              not null,
    city         varchar(30)                       not null,
    job_position varchar(50) default 'Безработный' not null,
    salary       decimal     default 0             not null,
    primary key (id)

);

select *
from users;

insert into users(first_name, last_name, birthdate, city)
values ('Антон', 'Антипов', '1997-02-25', 'Москва'),
       ('Илья', 'Ильин', '1976-05-26', 'Алматы'),
       ('Сергей', 'С', '1983-06-20', 'Киев'),
       ('Максим', 'П', '1995-12-11', 'Минск'),
       ('Владислав', 'К', '1951-05-01', 'Нур-Султан'),
       ('Александр', 'Т', '2000-07-29', 'Краснодар');
update users
set job_position = 'Строитель',
    salary       = 130000
where id = 3;

update users
set job_position = 'Грузчик',
    salary       = 100000
where id = 2;

update users
set job_position = 'Водитель',
    salary       = 150000
where id = 4;

update users
set job_position = 'Продавец',
    salary       = 160000
where id = 5;

update users
set job_position = 'Таксист',
    salary       = 140000
where id = 6;
delete
from users
where id = 1;
delete
from users
where id > 8;

select *
from users
order by city;

select *
from users
where salary >= 100000
  and salary <= 150000;

select *
from users
where salary between 100000 and 150000;

select *
from users
where birthdate between '1980-01-01' and '1999-12-31';

select *
from users
where first_name like '%е%';
select first_name, last_name
from users
order by salary desc
limit 1;

select count(id)               count,
       sum(salary)             total,
       max(salary)             max,
       min(salary)             min,
       avg(salary)             average_1,
       sum(salary) / count(id) average_2,
       round(avg(salary)),
       round(avg(salary), 2)
from users;

select job_position, count(job_position) count
from users
where job_position = 'Безработный'
group by job_position;


select city
from users
group by city
order by count(id) desc
limit 1;
select *
from users;







