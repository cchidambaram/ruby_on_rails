$:.unshift(File.join(File.dirname(__FILE__), '../..', 'src/models/'))

require 'transaction'

class Activity
  
  def self.deposit (transaction)
    transaction_id = Transaction.create( :account_id => transaction.account_id,
	                                       :time_stamp => DateTime.now,
                                         :amount => transaction.amount,
                                         :transaction_type_id => 1)
    account_detail = Account.find_by_id(transaction.account_id)
    Account.update(account_detail.id, :balance => account_detail.balance + transaction.amount )
  end
  
  def self.withdraw (transaction)
    transaction_id = Transaction.create( :account_id => transaction.account_id,
	                                       :time_stamp => DateTime.now,
                                         :amount => transaction.amount,
                                         :transaction_type_id => 2)
    account_detail = Account.find_by_id(transaction.account_id)
    Account.update(account_detail.id, :balance => account_detail.balance - transaction.amount )
  end
  
end
  