$:.unshift(File.join(File.dirname(__FILE__), '../..', 'src/models/'))

require 'customer'
require 'account'
require 'customer_account'

class Operation
  
  def self.add_customer (customer)
    Customer.create(:first_name => customer.first_name ,
                    :last_name => customer.last_name, 
                    :pin_no => customer.pin_no).id
  
  end
  
  def self.add_account (account, customer_id)
    id = Account.create( :account_type_id => account.account_type_id,
                         :balance =>  account.balance,
                         :credit_line => account.credit_line).id
    CustomerAccount.create(:account_id => id,
                           :customer_id => customer_id)
    id
  end
  
  def self.find_account_by_customer_id(customer)
    account_details = []
    account_list = CustomerAccount.where(:customer_id => customer.id)
    account_list.each do |acct|
      account_details.push(Account.find_by_id(acct.account_id))
    end
    account_details
  end
  
  def self.find_customer_by_account_id(account)
    customer_details = []
    customer_list = CustomerAccount.where(:account_id => account.id)
    customer_list.each do |cust|
      customer_details.push(Customer.find_by_id(cust.customer_id))
    end
    customer_details
  end
  
end
