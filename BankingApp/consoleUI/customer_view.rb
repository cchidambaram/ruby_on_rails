$:.unshift(File.join(File.dirname(__FILE__), '..', 'src/controllers'))
require 'operation'
require 'display_view'

def create_customer
  new_customer = Customer.new
  print "Enter First Name:"
  new_customer.first_name = gets.chomp
  print "Enter Last Name:"
  new_customer.last_name = gets.chomp
  print "Enter Pin No(4-digit):"
  new_customer.pin_no = gets.chomp
  new_customer_id = Operation.add_customer new_customer
  print "Customer ID : #{new_customer_id} \n\n"
end

def find_customer_by_acct_id
  account = Account.new
  print "Enter Account ID:"
  account.id = gets.chomp
  customer_details = Operation.find_customer_by_account_id account
  display_details_customer(customer_details)
end



    




