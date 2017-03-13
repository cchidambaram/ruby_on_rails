$:.unshift(File.join(File.dirname(__FILE__), '..', 'src/models/'))
$:.unshift(File.join(File.dirname(__FILE__), '..', 'test'))
$:.unshift '..'

require 'rollback'
require 'customer_account'
require 'test/unit'

class CustomerAccountTest < Test::Unit::TestCase
  
  def test_customer_account_create
    transaction_and_rollback do
      CustomerAccount.create( :id => 3,
                      :customer_id => 2,
                      :account_id =>  1 )
      assert_equal(3, CustomerAccount.count)               
    end
  end
  
  def test_assign_account_id
    transaction_and_rollback do
      CustomerAccount.update(2 , :account_id => 1)
      assert_equal(2, CustomerAccount.find_by_id(2).customer_id)
    end
  end  
  
  def test_assign_invalid_customer_id
    transaction_and_rollback do
      assert_raise(RuntimeError, "Customer ID doesn't exists") { CustomerAccount.create(:id => 3,
                                                                                 :account_id => 1,
                                                                                 :customer_id => 5)}
    end
  end
  
  def test_assign_invalid_account_id
    transaction_and_rollback do
      assert_raise(RuntimeError, "Account ID doesn't exists") { CustomerAccount.create(:id => 3,
                                                                                 :account_id => 5,
                                                                                 :customer_id => 1)}
    end
  end
  
end
