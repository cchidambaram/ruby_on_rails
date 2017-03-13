$:.unshift(File.join(File.dirname(__FILE__), '../..', 'src'))
require 'establish_connection'

class Account_Type < ActiveRecord::Base
  has_many :accounts
  
end