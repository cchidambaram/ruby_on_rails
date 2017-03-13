$:.unshift(File.join(File.dirname(__FILE__), '..', 'src/controllers'))
require 'Authorize'
require 'display_view'

def get_customer_info 
  customer = Customer.new
  print "Enter Customer ID:"
  customer.id = gets.chomp
  print "Enter Pin No:"
  customer.pin_no = gets.chomp
  customer
end

def Authorize(customer)
  return Authorize.verify(customer)
end



