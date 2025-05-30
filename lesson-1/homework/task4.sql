use lesson1;
GO
drop table if exists category;
create table category(
category_id int primary key,
category_name varchar(100));

drop table if exists item;
create table item(
item_id int primary key,
item_name varchar(50),
category_id int constraint FK__item foreign key references category(category_id));

alter table item
drop constraint FK__item;

alter table item
add constraint FK__item_new foreign key(category_id) references category(category_id);