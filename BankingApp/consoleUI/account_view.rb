$:.unshift(File.join(File.dirname(__FILE__), '..', 'src/controllers'))
require 'operation'
require 'display_view'

def create_account
  new_account = Account.new
  print "Enter Account Type: (1.Checking Account , 2.Saving Account):"
  new_account.account_type_id = gets.chomp
  print "Enter Initial Balance:(if default enter 0.00):"
  new_account.balance = gets.chomp
  print "Enter Credit limit(if default enter 0.00):"
  new_account.credit_line = gets.chomp
  print "Enter customer ID:"
  customer_id = gets.chomp
  new_account_id  = Operation.add_account(new_account, customer_id)
  print "Account ID : #{new_account_id} \n\n"
end

def find_account_by_customer_id
  customer = Customer.new
  print "Enter Customer ID:"
  customer.id = gets.chomp
  accounts_details = Operation.find_account_by_customer_id customer
  display_details_account(accounts_details)
end




