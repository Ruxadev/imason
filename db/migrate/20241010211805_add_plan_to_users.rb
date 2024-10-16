class AddPlanToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :plan, :string
    add_column :users, :payment_status, :string
  end
end
