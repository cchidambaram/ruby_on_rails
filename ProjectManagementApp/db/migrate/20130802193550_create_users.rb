class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :role_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :phone_no
      t.string :login_name
      t.string :password
      t.string :password
      t.boolean :approved
      t.boolean :active

      t.timestamps
    end
  end
end
