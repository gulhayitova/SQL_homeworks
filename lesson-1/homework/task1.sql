create database lesson1;
GO
use lesson1;
GO
drop table if exists student;
create table student(
id int,
name varchar(100),
age int);
alter table student
alter column id int not null;
