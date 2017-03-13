== README 

System Requirements
====================
Ruby  -  ruby 2.2.3 or greater
Sqlite3 Database - sqlite3 3.8.5 or greater

Gem Installation
=================
gem install activerecords
gem install sqlite3
gem install --no-rdoc --no-ri highline


To run the test case and code
==============================

rake file (make file) has been created to run both test cases and code.

To run the Rake file , from the current directory type the following command ( directory /BankingApp/ )
$ rake

Code tested in Mac OS

Rake Task
=========
Following task are defined in Rake File ( Make file )
 - create a DB file called BankingDB
 - run test cases 
 - bring up console UI to perform basic operations
 - delete the BankingDB file 
 
Code Structure
===============

CreateSchema.sql and seed data will be loaded as first step in rake file.

Test Driven Approach - rake test task will execute all the test cases automatically. 
					 - /BankingApp/test/ directory contains the test cases.

ConsoleUI is seperated from Controller and model code.
				- /BankingApp/consoleUI directory contains all the views
				- menu.rb provides basic functionalities
Models contains the class objects used 
				- /BankingApp/models/ directory contains the models and validation
				- No getters and setters used.

Controller - /BankingApp/controllers/ directory contains the business logic.
			


Default Account to test
=======================

Customer ID - 1
First Name - John
last name - Lee
pin_no - 1234

Account ID - 1
Balance - 100.00

Sample output
==============

1. create_customer
2. create_account
3. find_by_acct_id
4. find_by_cust_id
5. deposit
6. withdrawal
7. exit







