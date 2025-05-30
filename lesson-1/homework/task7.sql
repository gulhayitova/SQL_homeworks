use lesson1;

drop table if exists invoice;
create table invoice(
invoice_id int identity(1, 1),
amount decimal);

insert into invoice(amount)
values(20);
insert into invoice(amount)
values(28);
insert into invoice(amount)
values(23);
insert into invoice(amount)
values(24);
insert into invoice(amount)
values(48);

set identity_insert invoice on;
insert into invoice(invoice_id, amount) values(100, 32);
set identity_insert invoice off;

select * from invoice;