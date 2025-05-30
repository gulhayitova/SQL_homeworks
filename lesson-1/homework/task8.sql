use lesson1;

drop table if exists books;
create table books(
book_id int primary key identity(100, 1),
title varchar(200) not null,
price decimal(10, 2) check (price>0),
genre varchar(30) default 'Unknown');

--insert books values(null, 60000.00, 'Sentimental');
--insert books values('Little women', 0, 'Sentimental');
--insert books(title, price) values('Little women', 60000.00);
insert books values('Little women', 60000.00, 'Sentimental');
select * from books;