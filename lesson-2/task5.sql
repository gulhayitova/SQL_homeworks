use lesson2;

drop table if exists worker;
create table worker(
info varbinary(max)
);
insert into worker
select BulkColumn from openrowset(
	bulk 'C:\Users\New\Downloads\info_about_workers.csv', single_blob
) as info
select * from worker