use lesson2;
drop table if exists data_types_demo;
create table data_types_demo(
id uniqueidentifier not null, 
age tinyint,
days_alive smallint,
experience decimal(5,1) null,
date_applied date not null,
photo varbinary(max)
)
insert into data_types_demo
select newid(), 18, 6622, 1.5, getdate(), BulkColumn from openrowset(
	bulk 'C:\Users\New\Downloads\image.jpg', single_blob
) as img;
select * from data_types_demo