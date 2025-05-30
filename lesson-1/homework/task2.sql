use lesson1;
GO
drop table if exists product;
create table product(
product_id int constraint UQ__product_id unique,
product_name varchar(100),
price decimal);
alter table product
drop constraint UQ__product_id;
alter table product
add constraint UQ_product_id_name unique(product_id, product_name);