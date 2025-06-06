use lesson2;

create table photos(
id uniqueidentifier,
photo varbinary(max)
);
insert into photos
select newid(), BulkColumn from openrowset(
	bulk 'C:\Users\New\Downloads\image.jpg', single_blob
) as img_hsr;
