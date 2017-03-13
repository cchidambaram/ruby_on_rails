$:.unshift(File.join(File.dirname(__FILE__), '..', 'src/models/'))
$:.unshift(File.join(File.dirname(__FILE__), '..', 'test'))
$:.unshift '..'

require 'rollback'
require 'account'
require 'test/unit'

class AccountTest < Test::Unit::TestCase
  
  def test_account_count
    assert_equal 2,Account.count
  end
  
  def test_assign_account_type
    transaction_and_rollback do
      Account.update(2 , :account_type_id => 1)
      assert_equal(1, Account.find_by_id(2).account_type_id)
    end
  end  
  
  def test_account_create
    transaction_and_rollback do
      Account.create( :account_type_id => 2,
                      :balance =>  1000.00,
                      :credit_line => 1000.00 )
      assert_equal(3, Account.count)               
    end
  end
  
  def test_assign_account_with_invalid_account_type
    transaction_and_rollback do
      assert_raise(RuntimeError, "Account Type doesn't exists") { Account.create(:account_type_id => 3,
                                                                                 :balance =>  1000.00,
                                                                                 :credit_line => 1000.00  )}
    end
  end
  
  def test_account_balance_and_credit_line
    transaction_and_rollback do
      assert_equal(false, Account.create( :account_type_id => "2", :balance => "100",:credit_line => '100.9999').valid?)
      assert_equal(true, Account.create( :account_type_id => "2", :balance => "123.45",:credit_line => '100.00').valid?)
    end
  end
  
end
