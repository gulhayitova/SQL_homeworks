use lesson1;
go

drop table if exists customer;
create table customer(
customer_id int primary key,
name varchar(100),
city varchar(50) constraint D_city default 'Unknown');

alter table customer drop D_city;

alter table customer add constraint D_city_new default 'Unkown' for city;