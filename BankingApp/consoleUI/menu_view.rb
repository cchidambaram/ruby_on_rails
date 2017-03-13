$:.unshift(File.join(File.dirname(__FILE__), '..', 'consoleUI'))
require 'customer_view'
require 'account_view'
require 'transaction_view'
require "highline/import"

def rescue_exception
  begin
    yield
  rescue => ex
    print "\n#{ex} \n\n"
  end
end


begin
  loop do
    choose do |menu|
      menu.prompt = "Please select option "
      menu.choice(:create_customer){ rescue_exception{ create_customer()             }}
      menu.choice(:create_account) { rescue_exception{ create_account()              }}
      menu.choice(:find_by_acct_id){ rescue_exception{ find_customer_by_acct_id()    }}
      menu.choice(:find_by_cust_id){ rescue_exception{ find_account_by_customer_id() }}
      menu.choice(:deposit)        { rescue_exception{ deposit_money()               }}
      menu.choice(:withdrawal)     { rescue_exception{ withdraw_money()              }}
      menu.choice(:exit) { exit }
    end
  end
end

