use lesson4

create table letters
(letter char(1));

insert into letters
values ('a'), ('a'), ('a'), 
  ('b'), ('c'), ('d'), ('e'), ('f');

select *
from letters
order by 
	case when letter = 'b' then 1 else 0 end,
	letter

select *
from letters
order by 
	case when letter != 'b' then 1 else 0 end,
	letter
