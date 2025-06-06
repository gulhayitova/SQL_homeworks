use lesson2;

create table student(
classes tinyint,
tuition_per_class int,
total_tuition as (classes * tuition_per_class)
);
insert into student
values(6, 3000000),
	(5, 4500000),
	(6, 2500000);
select * from student