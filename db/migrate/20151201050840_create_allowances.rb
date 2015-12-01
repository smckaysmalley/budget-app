class CreateAllowances < ActiveRecord::Migration
  def change
    create_table :allowances do |t|
      t.text  :owner
      t.float :amount
      t.timestamps null: false
    end
  end
end
