$:.unshift(File.join(File.dirname(__FILE__), '../..', 'src'))
require 'establish_connection'

class Customer < ActiveRecord::Base
 
 has_many :customer_accounts
 
 validates :first_name, :last_name, :pin_no, presence:{ strict: true , :message => "Feilds can't be blank" }
 validates :first_name, :last_name, format:{strict:true , with: /\A[A-Za-z]+[.\s]*[A-Za-z]+\z/ , :message => "can contain only Alphabets"}
 validates :pin_no, numericality: { only_integer: true }
 validates :pin_no, length: { is: 4 }

end