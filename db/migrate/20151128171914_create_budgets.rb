class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.text  :owner
      t.text  :description
      t.float :amount
      t.date  :spent_on
      t.timestamps null: false
    end
  end
end
