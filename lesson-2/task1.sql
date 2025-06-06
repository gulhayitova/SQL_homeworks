create database lesson2;
use lesson2;
create table test_identity(
id int identity(1,1),
name varchar(20)
);
insert into test_identity(name)
select 'Aziz'
union select'Jasur'
union select 'Shohrux'
union select 'Nurislom'
union select 'Temurbek';

delete test_identity where id>3;
--2 rows were deleted
truncate table test_identity;
--all rows were deleted
drop table test_identity;
--the whole table was deleted