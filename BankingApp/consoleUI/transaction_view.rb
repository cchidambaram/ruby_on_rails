$:.unshift(File.join(File.dirname(__FILE__), '..', 'src/controllers'))
require 'activity'
require 'authorize_view'
require 'display_view'

def deposit_money
  customer = get_customer_info()
  if Authorize(customer)
    transaction = account_details(customer)
    accounts_details = Activity.deposit(transaction)
    print "\n Deposited \n\n"
    return true
  end
  print "Not Authorized \n\n"
end

def withdraw_money
  customer = get_customer_info()
  if Authorize(customer)
    transaction = account_details(customer)
    accounts_details = Activity.withdraw(transaction)
    print "\n With Draw completed \n\n"
    return true
  end
  print "Not Authorized \n\n"
end


def account_details(customer)
  accounts_details = Operation.find_account_by_customer_id customer
  display_details_account(accounts_details)
  transaction = Transaction.new
  print "Enter the Account ID for transaction:"
  transaction.account_id = gets.chomp
  print "Enter Amount:"
  transaction.amount = gets.chomp
  transaction
end

