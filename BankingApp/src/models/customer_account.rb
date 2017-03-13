$:.unshift(File.join(File.dirname(__FILE__), '../..', 'src'))
require 'establish_connection'
require 'account'
require 'customer'

class CustomerAccount < ActiveRecord::Base
  belongs_to :customer
  belongs_to :account
  
  validate :validate_account_id
  validate :validate_customer_id
  
  def validate_account_id
  	raise RuntimeError.new("Account ID doesn't exists") unless (Account.exists?(self.account_id) or self.account_id == nil)
  end
  
  def validate_customer_id
  	raise RuntimeError.new("Customer ID doesn't exists") unless (Customer.exists?(self.customer_id) or self.customer_id == nil)
  end
  
end