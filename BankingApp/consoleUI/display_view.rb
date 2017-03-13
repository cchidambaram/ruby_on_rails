$:.unshift(File.join(File.dirname(__FILE__), '..', 'src/controllers'))


def display_details_customer(customer_details)
  print "\nNo Customer found\n\n" if customer_details.empty?
  customer_details.each do |customer|
      printf "\n%-20s:%s","Customer ID" , customer.id
      printf "\n%-20s:%s","First Name",customer.first_name
      printf "\n%-20s:%s","Last Name", customer.last_name
      printf "\n\n"
   end
end

def display_details_account(accounts_details)
  print "\nNo Accounts found\n\n" if accounts_details.empty?
  accounts_details.each do |account|
      printf "\n%-20s:%s","Account ID" , account.id
      printf "\n%-20s:%s","Balance",account.balance
      printf "\n%-20s:%s","Credit Line", account.credit_line
      printf "\n\n"
   end
end