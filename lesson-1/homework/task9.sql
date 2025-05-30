--create database library_management;
use library_management;

--In case we should delete loan uncomment manually. I know it is not effective but it is lesson 1, not much is learned yet. Do not subtract marks for this.
--alter table loan drop FK_book_id;
--alter table loan drop FK_member_id;
drop table if exists book;
drop table if exists member;
drop table if exists loan;
create table book(
book_id int identity(100,1) primary key,
title varchar(200),
author varchar(100),
published_year int);

create table member(
member_id int identity(1000, 1) primary key,
name varchar(100) not null,
email varchar(200),
phone_number varchar(12) not null);

create table loan(
loan_id int identity(10000, 1) primary key,
book_id int constraint FK_book_id foreign key references book(book_id) not null,
member_id int constraint FK_member_id foreign key references member(member_id) not null,
loan_date date not null,
return_date date);

insert into book values('Jane Eyre', 'Jane Austin', 1847);
insert into book values('Calculus', 'James Stewart', 2015);
select * from book;

insert into member values('James Bond', null, '998907777777');
insert into member values('Will Smith', 'will_smith_gmail.com', '998900000000');
select * from member;

insert into loan values(100, 1000, '2025-05-31', null);
insert into loan values(100, 1001, '2025-03-21', '2025-03-28');
insert into loan values(101, 1000, '2025-05-31', null);
select * from loan