create database coltdb;

use coltdb;

create table pastries (
name varchar(50),
quantity int
);

show columns from pastries;

drop table pastries;

create table cats (
name varchar(50),
age int);

insert into cats (name, age) values ('Blue', 1);

show columns from cats;

insert into cats (name, age)
values ('Red', 2),
('Green', 5),
('Purple', 9);

create table cats3 (
name varchar(20) default 'default value',
age int default 99);

insert into cats3(age) values (13);

select * from cats3;

create table cats4 (
name varchar(20) not null default 'le default',
age int not null default 99
);

desc cats4;

insert into cats4(name, age) values (, null);

show columns from cats4;
insert into cats4(name, age) values ('null', 8);

select * from cats4;

desc cats4;

create table cats5 (id int not null auto_increment,
name varchar(25) not null default 'missing',
age INT default 99,
primary key (id)
);

desc cats5;

insert into cats5 (name, age) values ('chico', 5), ('chica', 8);

select * from cats5;

create table employees
(
id int not null auto_increment,
last_name varchar(20) not null,
first_name varchar(20) not null,
middle_name varchar(20),
age int not null,
current_status varchar(20) not null default 'employed',
primary key (id)
);

insert into employees (last_name, first_name, age) values
('ln1', 'fn1', 50 )
;

insert into employees (last_name, first_name, middle_name, age, current_status)
values ('ln2', 'fn2', null, 80, 'employed'),
    ('ln3', 'fn3', 'mn3', 50, 'terminated')
;



