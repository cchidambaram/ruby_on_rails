class CreateIssuepriorities < ActiveRecord::Migration
  def change
    create_table :issuepriorities do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
