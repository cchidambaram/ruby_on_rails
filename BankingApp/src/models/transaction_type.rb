$:.unshift(File.join(File.dirname(__FILE__), '../..', 'src'))
require 'establish_connection'

class Transaction_Type < ActiveRecord::Base
  has_many :transactions
  
end