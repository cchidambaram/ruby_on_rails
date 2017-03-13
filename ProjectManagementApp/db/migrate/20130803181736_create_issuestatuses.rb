class CreateIssuestatuses < ActiveRecord::Migration
  def change
    create_table :issuestatuses do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
