$:.unshift(File.join(File.dirname(__FILE__), '../..', 'src/models/'))

require 'customer'

class Authorize
  
  def self.verify (customer)
    customer_detail = Customer.find_by_id(customer.id)
    return (customer_detail.pin_no == customer.pin_no)
  end
  
end
  