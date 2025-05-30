use lesson1;
go

drop table if exists account;
create table account(
account_id int primary key,
balance decimal constraint CHK_balance check (balance>=0),
account_type varchar(10) constraint CHK_account_type check (account_type='Saving' or account_type='Checking'));

alter table account drop constraint CHK_balance;
alter table account drop constraint CHK_account_type;

alter table account add constraint CHK_balance_new check (balance>=0);
alter table account add constraint CHK_account_type check (account_type='Saving' or account_type='Checking');