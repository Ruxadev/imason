class AddRoleToWorkers < ActiveRecord::Migration[7.2]
  def change
    add_column :workers, :role, :string
  end
end
