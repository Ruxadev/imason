class AddQuantityToMaterials < ActiveRecord::Migration[7.2]
  def change
    add_column :materials, :quantity, :integer
  end
end
