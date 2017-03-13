$:.unshift(File.join(File.dirname(__FILE__), '../..', 'src'))
require 'establish_connection'
require 'account_type'

class Account < ActiveRecord::Base
  belongs_to :account_type
  
  validate :validate_account_type_id
  validates_numericality_of :balance, :credit_line, :less_than => 10000000000    
  validates_format_of :balance,:credit_line, :with => /\A\d+(?:\.\d{0,2})?\z/
  
  def validate_account_type_id
  	raise RuntimeError.new("Account Type doesn't exists") unless (Account_Type.exists?(self.account_type_id) or self.account_type_id == nil)
  end
  
end