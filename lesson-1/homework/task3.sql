use lesson1
go
drop table if exists orders
create table orders(
order_id int constraint PK__orders primary key,
customer_name varchar(100),
order_date date);
alter table orders
drop constraint PK__orders;
alter table orders
add constraint PK__orders_new primary key(order_id);