insert into customers values (null,'John','Lee','1234');
insert into customers values (null,'Tom','Lee','1234');

insert into account_types values (null,'checking account' , 'Checking account with no interest');
insert into account_types values (null,'saving account','Saving account with interest');
	
insert into transaction_types values (1,'Deposit','Money deposit');
insert into transaction_types values (2,'WithDraw','Money withdrawal');
insert into transaction_types values (3,'Transfer',' Money transfer');


insert into accounts values (null,1,100.00,100.00);
insert into accounts values (null,2,1000.00,1000.00);

insert into customer_accounts values (null,1,1);
insert into customer_accounts values (null,2,2);
	
 