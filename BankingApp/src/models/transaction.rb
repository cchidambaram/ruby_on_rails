$:.unshift(File.join(File.dirname(__FILE__), '../..', 'src'))
require 'establish_connection'
require 'account'
require 'transaction_type'

class Transaction < ActiveRecord::Base
  
  belongs_to :account
  belongs_to :transaction_type
  
  validate :validate_account_id
  validate :validate_transaction_type_id
  
  def validate_account_id
  	raise RuntimeError.new("Account ID doesn't exists") unless (Account.exists?(self.account_id) or self.account_id == nil)
  end
  
  def validate_transaction_type_id
    raise RuntimeError.new("Transaction Type doesn't exists") unless (Transaction_Type.exists?(self.transaction_type_id) or self.transaction_type_id == nil)
  end
  
end