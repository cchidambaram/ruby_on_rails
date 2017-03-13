drop table if exists customers;
drop table if exists accounts;
drop table if exists account_types;
drop table if exists customer_accounts;
drop table if exists transactions;
drop table if exists transaction_type;

create table customers(
	id INTEGER primary key,
	first_name nvarchar(50) not null,
	last_name nvarchar(50) not null,
	pin_no numeric(4,0) not null
);

create table account_types(
	id INTEGER primary key,
	type nvarchar(20) not null,
	description nvarchar(50) not null 
);

create table accounts(
	id INTEGER primary key,
	account_type_id INTEGER,
	balance decimal(10,2),
	credit_line decimal(10,2)
);


create table customer_accounts(
	id INTEGER primary key,
	customer_id INTEGER,
	account_id INTEGER
);

create table transaction_types(
	id INTEGER primary key,
	type nvarchar(20) not null,
	description nvarchar(50) not null
);

create table transactions(
	id INTEGER primary key,
	account_id INTEGER,
	time_stamp datetime,
	amount decimal(10,2),
	transaction_type_id string
);


