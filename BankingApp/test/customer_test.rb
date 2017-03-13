$:.unshift(File.join(File.dirname(__FILE__), '..', 'src/models/'))
$:.unshift(File.join(File.dirname(__FILE__), '..', 'test'))
$:.unshift '..'

require 'rollback'
require 'customer'
require 'test/unit'

class CustomerTest < Test::Unit::TestCase
  
  def test_customer_create
    transaction_and_rollback do
      Customer.create(:first_name => "Testfirstname" , :last_name => "Testlastname", :pin_no => "1234")
      assert_equal(3, Customer.count)
    end
  end

  def test_customer_needs_a_name
    transaction_and_rollback do
      assert_raise(ActiveModel::StrictValidationFailed){ Customer.create(:first_name => "" , :last_name => "" , :pin_no => "1234")}
   end
  end

  def test_customer_needs_a_first_name
    transaction_and_rollback do
      assert_raise(ActiveModel::StrictValidationFailed){ Customer.create(:first_name => "" , :last_name => "lastname", :pin_no => "1234")}
    end
  end

  def test_customer_needs_a_last_name
    transaction_and_rollback do
      assert_raise(ActiveModel::StrictValidationFailed){ Customer.create(:first_name => "firstname" , :last_name => "", :pin_no => "1234")}
    end
  end
  
  def test_customer_needs_a_pin_no
    transaction_and_rollback do
      assert_raise(ActiveModel::StrictValidationFailed){ Customer.create(:first_name => "firstname" , :last_name => "lastname", :pin_no => "")}
    end
  end
  
  def test_customer_pin_no_only_4_digits
    transaction_and_rollback do
      assert_equal(false, Customer.create(:first_name => "firstname" , :last_name => "lastname", :pin_no => "12345").valid?)
    end
  end
  
end






